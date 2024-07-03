PY_CMD = "py"
if (sys.version_info > (3, 0)):
    PY_CMD = "py3"

import vim
import os
# import importlib.util
# cfile = importlib.util.spec_from_file_location('extpathloader', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/extpathloader.py')) 
# module = importlib.util.module_from_spec(cfile)
# globals()["extpathloader"] = module
# importlib.util.spec_from_file_location('javahelpers', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/javahelpers.py')) 
# module = importlib.util.module_from_spec(cfile)
# globals()["javahelpers"] = module
# from importlib.machinery import SourceFileLoader
# globals()['extpathloader'] = SourceFileLoader('extpathloader', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/extpathloader.py')).load_module()
# globals()['javahelpers'] = SourceFileLoader('extpathloader', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/javahelpers.py')).load_module()

# globals()["extpathloader"] = (__import__('imp')).load_source('extpathloader', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/extpathloader.py'))
# globals()["javahelpers"] = (__import__('imp')).load_source('javahelpers', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/javahelpers.py'))
from UltiSnips import UltiSnips_Manager

is_win = vim.eval('has("win32")') == "1"

def hook(row,col):
    snippet = None
    start_cursor = vim.current.window.cursor
    ln = len(UltiSnips_Manager._active_snippets)
    last = None
    while ln >= 1 and UltiSnips_Manager._active_snippets[ln - 1] != snippet:
        snippet = UltiSnips_Manager._active_snippets[ln - 1]
        cursor = vim.current.window.cursor
        if last == None:
            last = snippet
        UltiSnips_Manager.jump_forwards()
        ln = len(UltiSnips_Manager._active_snippets)
        if ln > 0:
            end = snippet.end
            # vim.current.window.cursor = (end[0]+1,end[1]-1)
            if cursor[0] == end[0] + 1 and cursor[1] == end[1] and UltiSnips_Manager._active_snippets[ln - 1] != snippet and last.end[0] == snippet.end[0] and last.end[1] == snippet.end[1]:
                last = snippet
                continue
            else:
                break
        else:
            break
        # last = snippet
    if start_cursor[0] > vim.current.window.cursor[0] or (start_cursor[0] == vim.current.window.cursor[0] and start_cursor[1] > vim.current.window.cursor[1]):
        vim.current.window.cursor = (start_cursor[0],start_cursor[1])
    return ''

def check_move():
    import re
    vim.command('set eventignore=all')

    UltiSnips_Manager._cursor_moved()
    # vim.vars['tadaa_check_move_res'] = vim.eval('UltiSnips#ExpandSnippet()')
    cursor = vim.current.window.cursor
    col = cursor[1]-1
    row = cursor[0]-1
    line = vim.current.buffer[row][col:]
    # if len(line) != 0 and line[0] != '}' and line[0] != ' ':
    if len(line) != 0 and line[0] != ' ':
        UltiSnips_Manager.expand()
    else:
        vim.vars['ulti_expand_res'] = 0
    # UltiSnips_Manager.expand()
    # vim.eval('feedkeys("\<c-h>")')
    # UltiSnips_Manager.expand()
    # vim.eval('UltiSnips#TrackChange()')

    vim.vars['tadaa_skip_return'] = 0
    if int(vim.vars['ulti_expand_res']) != 0:
        vim.vars['tadaa_check_move_res'] = ''
    else:
        if len(line) == 0 or line[0] == ' ' and vim.vars['tadaa_check_move_res'] == ' ':
            if len(line):
                # echo 1
                # for YCM
                # vim.vars['tadaa_check_move_res']=" "
                # vim.eval('feedkeys("\<bs>\<bs>\<C-R>='+PY_CMD+'eval(\'hook('+str(row)+','+str(col)+')\')\<CR>")')
                # if 'ycm_auto_trigger' in vim.vars and vim.vars['ycm_auto_trigger']:
                # if int(vim.eval("pumvisible()")):
                    # vim.vars['tadaa_check_move_res']=" "
                    # vim.eval('feedkeys("\<bs>\<bs>\<C-R>='+PY_CMD+'eval(\'hook('+str(row)+','+str(col)+')\')\<CR>")')
                # else:
                    # vim.eval('feedkeys("\<bs>")')
                    # vim.vars['tadaa_check_move_res']="\<bs>"
                # cursor = vim.current.window.cursor
                #TODO iswindows
                if is_win:
                    #vim.current.buffer[row] = vim.current.buffer[row][0:col] + vim.current.buffer[row][col+2:]
                    vim.current.buffer[row] = vim.current.buffer[row][0:col] + vim.current.buffer[row][col+1:]
                else:
                    vim.current.buffer[row] = vim.current.buffer[row][0:col] + vim.current.buffer[row][col+1:]
                UltiSnips_Manager._cursor_moved()
                # vim.current.window.cursor = (row+1,col+2)
                # vim.eval('UltiSnips#TrackChange()')
                # vim.vars['tadaa_check_move_res'] = vim.eval('UltiSnips#ExpandSnippetOrJump()')
                # vim.eval('feedkeys("\<c-j>")')
                # UltiSnips_Manager.expand_or_jump()
                hook(row,col)
                # if vim.current.buffer[row][col- 1] != '}':
                    # UltiSnips_Manager.expand_or_jump()
                # else:
                    # UltiSnips_Manager.jump_forwards()
                # vim.vars['tadaa_check_move_res']
                # vim.eval('UltiSnips#TrackChange()')
                # hook(row, col)
                    # vim.eval('feedkeys("\<bs>\<C-R>='+PY_CMD+'eval(\'hook('+str(row)+','+str(col)+')\')\<CR>")')
                vim.vars['tadaa_check_move_res'] = ''
            else:
                UltiSnips_Manager.expand_or_jump()
                vim.vars['tadaa_check_move_res'] = ''
                # UltiSnips_Manager._cursor_moved()
        else:
            if vim.current.buffer[row][col] != ' ':
                # vim.eval('feedkeys("  ", "mtx")')
                if is_win:
                    # vim.current.buffer[row] = vim.current.buffer[row][0:col+0] + vim.current.buffer[row][col] + ' ' + vim.current.buffer[row][col+1:]
                    # end = vim.current.buffer[row][col+1:]
                    # val = vim.current.buffer[row][col]
                    # vim.current.buffer[row] = vim.current.buffer[row][0:col+1]
                    # vim.eval('feedkeys("'+val+'", "nt")')
                    vim.current.window.cursor = (row+1,col+1)
                    vim.eval('feedkeys(" ", "nt")')
                    # vim.current.buffer[row] = vim.current.buffer[row] + end
                    #vim.eval('feedkeys("'+vim.current.buffer[row][col]+'", "nt")')
                    # vim.eval('feedkeys(" ", "nt")')
                    #UltiSnips_Manager._cursor_moved()
                    vim.vars['tadaa_check_move_res']=" "
                    vim.vars['tadaa_skip_return'] = 1
                    # UltiSnips_Manager._cursor_moved()
                else:
                    vim.eval('feedkeys("'+vim.current.buffer[row][col]+'", "nt")')
                    vim.eval('feedkeys(" ", "nt")')
                    UltiSnips_Manager._cursor_moved()
                    vim.vars['tadaa_check_move_res']=" "
                # vim.current.buffer[row] = vim.current.buffer[row][0:col+0] + vim.current.buffer[row][col] + '  ' + vim.current.buffer[row][col+1:]
                # print(123)

                UltiSnips_Manager._cursor_moved()
                #vim.vars['tadaa_check_move_res']=" "
            else:
                UltiSnips_Manager.expand_or_jump()
                vim.vars['tadaa_check_move_res'] = ''
            # vim.current.buffer[row] = vim.current.buffer[row][0:col+1] + ' ' + vim.current.buffer[row][col+1:]
            # vim.eval('UltiSnips#TrackChange()')
            # vim.current.window.cursor = (row+1,col+2)
            # vim.command('execute feedkeys(" ")')
            # vim.eval('UltiSnips#TrackChange()')
            # vim.command('let v:char=" "')
            # vim.command('let v:char=""')
            # vim.vars['tadaa_check_move_res']=" "
    vim.command('set eventignore=')

def checkComma():
    cursor = vim.current.window.cursor
    col = cursor[1]-1
    row = cursor[0]-1
    buffer = vim.current.window.buffer[row]
    if len(buffer) > 0 and buffer[col] == ',':
        vim.current.window.buffer[row]=buffer[:col] + buffer[col+1:]
        vim.current.window.cursor = (row+1,col)
        vim.vars['tadaa_regex_res']=1
    else:
        vim.vars['tadaa_regex_res']=0
