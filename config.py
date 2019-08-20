PY_CMD = "py"
if (sys.version_info > (3, 0)):
    PY_CMD = "py3"

import vim
import os
import importlib.util
# cfile = importlib.util.spec_from_file_location('extpathloader', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/extpathloader.py')) 
# module = importlib.util.module_from_spec(cfile)
# globals()["extpathloader"] = module
# importlib.util.spec_from_file_location('javahelpers', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/javahelpers.py')) 
# module = importlib.util.module_from_spec(cfile)
# globals()["javahelpers"] = module
globals()["extpathloader"] = (__import__('imp')).load_source('extpathloader', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/extpathloader.py'))
globals()["javahelpers"] = (__import__('imp')).load_source('javahelpers', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/javahelpers.py'))
from UltiSnips import UltiSnips_Manager

def hook(row,col):
    snippet = None
    start_cursor = vim.current.window.cursor
    ln = len(UltiSnips_Manager._active_snippets)
    while ln >= 1 and UltiSnips_Manager._active_snippets[ln - 1] != snippet:
        snippet = UltiSnips_Manager._active_snippets[ln - 1]
        UltiSnips_Manager.expand_or_jump()
        ln = len(UltiSnips_Manager._active_snippets)
        if ln > 0:
            end = snippet.end
            if vim.current.window.cursor[0] == end[0] + 1 and vim.current.window.cursor[1] == end[1] and UltiSnips_Manager._active_snippets[ln - 1] != snippet:
                continue
    if start_cursor[0] > vim.current.window.cursor[0] or (start_cursor[0] == vim.current.window.cursor[0] and start_cursor[1] > vim.current.window.cursor[1]):
        vim.current.window.cursor = (start_cursor[0],start_cursor[1])
    return ''

def check_move():
    import re
    cursor = vim.current.window.cursor
    col = cursor[1]-1
    row = cursor[0]-1

    UltiSnips_Manager.expand()
    vim.vars['tadaa_check_move_res'] = ""
    if vim.vars['ulti_expand_res'] == 0:
        line = vim.current.buffer[row][col:]
        if len(line) == 0 or line[0] == ' ':
            if len(line):
                # for YCM
                # vim.vars['tadaa_check_move_res']=" "
                # vim.eval('feedkeys("\<bs>\<bs>\<C-R>='+PY_CMD+'eval(\'hook('+str(row)+','+str(col)+')\')\<CR>")')
                if 'ycm_auto_trigger' in vim.vars and vim.vars['ycm_auto_trigger']:
                    vim.vars['tadaa_check_move_res']=" "
                    vim.eval('feedkeys("\<bs>\<bs>\<C-R>='+PY_CMD+'eval(\'hook('+str(row)+','+str(col)+')\')\<CR>")')
                else:
                    vim.eval('feedkeys("\<bs>\<C-R>='+PY_CMD+'eval(\'hook('+str(row)+','+str(col)+')\')\<CR>")')
            else:
                UltiSnips_Manager.expand_or_jump()
        else:
            vim.current.window.cursor = (row+1,col+1)
            vim.vars['tadaa_check_move_res']=" "

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
