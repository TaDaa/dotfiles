let g:arr_esc="\<c-[>"

set nocompatible
behave mswin

let g:user_vim_dir=fnamemodify("~/.vim",":p") "full path to vim files
if has("win32")
    source $VIMRUNTIME/mswin.vim
    syntax on
    let g:user_vim_dir=substitute(g:user_vim_dir,'/','\\','g')
endif

let &runtimepath.=",".g:user_vim_dir."custom"
let &runtimepath.=",".g:user_vim_dir."dependencies"
"let &runtimepath.=','.g:user_vim_dir.'vimfiles'

"set rtp-='~/.vim/vimfiles'
set rtp-='~/vimfiles'

filetype off
let &runtimepath.=",".g:user_vim_dir."bundle/vundle"
call vundle#rc()


"preload eclim
"Bundle 'vimfiles/eclim'
Bundle 'vimfiles'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gosukiwi/vim-atom-dark'
Bundle 'chriskempson/base16-vim'
Bundle 'tpope/vim-surround'
Bundle 'tomasr/molokai'
Bundle 'nielsmadan/harlequin'
Bundle 'nanotech/jellybeans.vim'
Bundle 'twerth/ir_black'
Bundle 'w0ng/vim-hybrid'
Bundle 'noahfrederick/vim-hemisu'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/emmet-vim'
Bundle 'skammer/vim-css-color'
Bundle 'morhetz/gruvbox'
Bundle 'vim-scripts/candycode.vim'
Bundle 'rking/ag.vim'
Bundle 'vim-scripts/summerfruit256.vim'
Bundle 'vim-scripts/pyte'
Bundle 'vim-scripts/moria'
Bundle 'vim-scripts/ironman.vim'
Bundle 'vim-scripts/louver.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'SirVer/ultisnips'
Bundle 'git://repo.or.cz/vcscommand'
"Bundle 'juneedahamed/vc.vim'
Bundle 'neowit/vim-force.com'
Bundle 'ciaranm/detectindent'
Bundle 'cocopon/iceberg.vim'
Bundle 'reedes/vim-colors-pencil'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'TaDaa/vim-emmet-autocompleter'
Bundle 'TaDaa/vim-emmet-visualforce-autocompleter'
Bundle 'TaDaa/vim-emmet-android-autocompleter'
Bundle 'juneedahamed/vc.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'oplatek/Conque-Shell'
Bundle 'greyblake/vim-preview'
Bundle 'leafgarland/typescript-vim'

"Bundle 'emmet-completions'
"Bundle 'emmet-completions-visualforce'
"Bundle 'tadaa'
"Bundle 'async-complete'

filetype on
filetype plugin on 
filetype indent on
"instead of cd -- select the first directory in nerd tree bookmars
"
"cd /IDEXX/projects/trunk/src/main/webapp "current working directory
"cd /IDEXX/projects/ForceTadaa "current working directory


autocmd FileType scss syn cluster sassCssAttributes add=@cssColors "VIM-CSS-COLOR
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd BufEnter * call BuffEnter()
autocmd FileType javascript,js,jsx call BuffEnter()
autocmd VimEnter * wincmd w

function BuffEnter ()
    set smarttab
    set smartindent
endfunction

let g:NERDTreeChDirMode=2 "NERDTree
let g:NERDTreeMapOpen='<CR>' "NERDTree
let g:NERDTreeMapPreview='<S-CR>' "NERDTree
let g:NERDTreeMapOpenSplit='<C-x>' "NERDTree
let g:NERDTreeMapPreviewSplit='px' "NERDTree
let g:NERDTreeMapOpenVSplit='<C-v>' "NERDTree
let g:NERDTreeMapPreviewVSplit='pv' "NERDTree
let g:ctrlp_working_path_mode = '0' "CTRLP
let g:ctrlp_custom_ignore = { 
	\ 'dir' : '\v[\/](LYNXXLogs|target|\.DS_STORE|\.settings|\.svn|\.git|\.hg|\.sencha|\.sass-cache|build|fa|webapp/ext|webapp/touch|images|icons|docs|deft|fonts|assembly|test|classes|debug|node_modules)$',
\ } "CTRLP
let g:aghighlight=1 "AG
let g:agformat="%f:%l:%c:%m" "AG
"let g:ycm_server_keep_logfiles=1
"let g:ycm_server_log_level='debug'
let g:ycm_global_ycm_extra_conf= g:user_vim_dir.'custom/ycm/.ycm_extra_conf.py'
let g:EclimCompletionMethod = 'omnifunc' "YCM
let g:EclimJavascriptLintConf=g:user_vim_dir.'custom/Eclim/jslint.conf' "ECLIM validation
"THESE TWO WERE CHANGED FROM NUL -- MIGHT NEED TO CHANGE BACK DEPENDING ON OS
"-- IF SO PUT BELOW
let g:UltiSnipsExpandTrigger="<c-j>"  "ULTISNIPS
let g:UltiSnipsJumpForwardTrigger="<c-j>" "ULTISNIPS

let g:UltiSnipsJumpBackwardTrigger="<c-k>" "ULTISNIPS
let delimitMate_expand_cr=1
let g:emmet_completions_use_omnifunc=1 "vim-emmet-autocompleter
let g:apex_server=1 "force
let g:apex_server_timeoutSec=60*30


let g:apex_backup_folder="/Users/tlovell/.force/backup"
let g:apex_temp_folder="/Users/tlovell/.force/temp"
let g:apex_properties_folder="/Users/tlovell/.force"
let g:apex_tooling_force_dot_com_path=g:user_vim_dir.'/dependencies/shared/force/tooling-force.com-0.3.3.2.jar'
"let g:apex_tooling_force_dot_com_path=g:user_vim_dir.'\\dependencies\\windows\\force\\tooling-force.com-0.3.1.6a.jar'
"let g:apex_tooling_force_dot_com_path='C:/IDEXX/projects/git/tooling-force.com/target/scala-2.10/tooling-force.com-assembly-0.1-SNAPSHOT.jar'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'cs' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

"\	'test' : ['<','>',':']

" USER SPECIFIED
:command Bd bd
set number
set relativenumber
set nowrap
set ic!
set fenc=utf-8
set background=dark
set lsp=1
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set incsearch
set hlsearch
set smartindent
set autoindent
set cot=menu,longest,menuone
set encoding=utf-8
set anti

colorscheme hemisu
hi LineNr guifg=#555555
hi Normal guibg=#012333 guifg=#eeeeee	
hi Visual guibg=#555555



"status line
set laststatus=2                             " always show statusbar  
set statusline=[%.n]%m\ %f%=%<%P

"visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


"REMAP
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>ct :call NERDComment(0,"toggle")<CR>
vnoremap <Leader>ct :call NERDComment(0,"toggle")<CR>
imap <c-l> <right>
imap <c-h> <left>





python << EOF
import vim
import os
globals()["extpathloader"] = (__import__('imp')).load_source('extpathloader', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/extpathloader.py'))
globals()["javahelpers"] = (__import__('imp')).load_source('javahelpers', os.path.realpath(vim.eval('g:user_vim_dir')+'custom/UltiSnips/javahelpers.py'))
EOF


silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'

"autocmd FileType scss syn cluster sassCssAttributes add=@cssColors "VIM-CSS-COLOR

"autocmd VimEnter * call VimEntered()
"function! VimEntered ()
    "NERDTree
    "call feedkeys("\<s-b>")
"endfunction

let g:multi_cursor_normal_maps={'!':1, '@':1, '=':1, 'q':1, 'r':1, 't':1, 'T':1, 'y':1, '[':1, ']':1, '\':1, 'd':1, 'f':1, 'F':1, 'g':1, '"':1, 'z':1, 'c':1, 'm':1, '<':1, '>':1}
let g:multi_cursor_visual_maps={'F':1,'f':1}

"SPECIAL ECLIPSE COMMAND  -- open in eclipse
command! -nargs=* EclipseOpen call EclipseOpen(<f-args>)

function! EclipseOpen (...) 
    if a:0
        let f=getcwd()."/".a:1
    else
        let f=expand('%')
    endif
    exec("!open -a \"Eclipse\ Neon\" ".f)
endfunction

command! -nargs=+ JavaBuffer call JavaBuffer(<q-args>)

let g:java_homes = {   8 : '/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home',  7 : '/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home' ,  6 : '/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home' }
function! JavaBuffer (...)
    if a:0 < 1
        let v = 8
    else
        let v = a:1
    endif
    call JavaCompileAndRunBuffer(g:java_homes[v])
endfunction


function! JavaCompileAndRunBuffer (java_home)
    let f=expand('%')
    let pd = GetPackageDirectory(f)
    let cp = 'target/classes:/Users/tlovell/.m2/repository/com/idexx/applications/lynxx/dataservices/LYNXXDataServicesSDO/3.7.1.1-SNAPSHOT/LYNXXDataServicesSDO-3.7.1.1-SNAPSHOT.jar:/Users/tlovell/.m2/repository/com/idexx/applications/lynxx/schemas/LYNXXSchemas/3.7.1.0-SNAPSHOT/LYNXXSchemas-3.7.1.0-SNAPSHOT.jar:/Users/tlovell/.m2/repository/com/jidesoft/jide-oss/3.6.12/jide-oss-3.6.12.jar:/Users/tlovell/.m2/repository/com/idexx/libs/core/SwingCore/1.1.21/SwingCore-1.1.21.jar:/Users/tlovell/.m2/repository/log4j/log4j/1.2.16/log4j-1.2.16.jar:/Users/tlovell/.m2/repository/com/inet/jortho/0.4/jortho-0.4.jar:/Users/tlovell/.m2/repository/org/swinglabs/swingx/1.6/swingx-1.6.jar:/Users/tlovell/.m2/repository/com/jidesoft/jide-jdaf/2.3.0/jide-jdaf-2.3.0.jar:/Users/tlovell/.m2/repository/com/jidesoft/jlfgr/1.0/jlfgr-1.0.jar:/Users/tlovell/.m2/repository/commons-lang/commons-lang/2.3/commons-lang-2.3.jar:/Users/tlovell/.m2/repository/com/jidesoft/jide/jide-grids/2.8.7/jide-grids-2.8.7.jar:/Users/tlovell/.m2/repository/com/jidesoft/jide/jide-common/2.8.7/jide-common-2.8.7.jar:/Users/tlovell/.m2/repository/jgoodies/forms/1.0.4/forms-1.0.4.jar:/Users/tlovell/.m2/repository/org/swinglabs/jxlayer/3.0.3/jxlayer-3.0.3.jar:/Users/tlovell/.m2/repository/com/idexx/libs/core/I18NCore/1.0.12/I18NCore-1.0.12.jar:/Users/tlovell/Documents/workspaces/LYNXX/LYNXXTransfersMicroServicesAPI/target/classes:/Users/tlovell/Documents/workspaces/LYNXX/LYNXXTransfersLibraries/target/classes:/Users/tlovell/.m2/repository/com/sun/jersey/jersey-bundle/1.17.1/jersey-bundle-1.17.1.jar:/Users/tlovell/.m2/repository/com/sun/jersey/jersey-core/1.17.1/jersey-core-1.17.1.jar:/Users/tlovell/.m2/repository/org/codehaus/jackson/jackson-core-asl/1.9.2/jackson-core-asl-1.9.2.jar:/Users/tlovell/.m2/repository/org/codehaus/jackson/jackson-mapper-asl/1.9.2/jackson-mapper-asl-1.9.2.jar:/Users/tlovell/.m2/repository/org/codehaus/jackson/jackson-jaxrs/1.9.2/jackson-jaxrs-1.9.2.jar:/Users/tlovell/.m2/repository/org/codehaus/jackson/jackson-xc/1.9.2/jackson-xc-1.9.2.jar:/Users/tlovell/.m2/repository/com/sun/jersey/jersey-multipart/1.17.1/jersey-multipart-1.17.1.jar:/Users/tlovell/.m2/repository/org/eclipse/persistence/javax.persistence/2.1.1/javax.persistence-2.1.1.jar:/Users/tlovell/.m2/repository/log4j/log4j/1.2.16/log4j-1.2.16.jar:/Users/tlovell/.m2/repository/com/oracle/ojdbc6/11.1.0.7.0/ojdbc6-11.1.0.7.0.jar:/Users/tlovell/.m2/repository/org/eclipse/persistence/eclipselink/2.3.1/eclipselink-2.3.1.jar:/Users/tlovell/.m2/repository/javax/xml/ws/jaxws-api/2.2.8/jaxws-api-2.2.8.jar:/Users/tlovell/.m2/repository/javax/xml/bind/jaxb-api/2.2.4/jaxb-api-2.2.4.jar:/Users/tlovell/.m2/repository/javax/xml/stream/stax-api/1.0-2/stax-api-1.0-2.jar:/Users/tlovell/.m2/repository/javax/activation/activation/1.1/activation-1.1.jar:/Users/tlovell/.m2/repository/javax/xml/soap/saaj-api/1.3.4/saaj-api-1.3.4.jar:/Users/tlovell/.m2/repository/org/glassfish/javax.annotation/3.1.1/javax.annotation-3.1.1.jar:/Users/tlovell/.m2/repository/javax/jws/jsr181-api/1.0-MR1/jsr181-api-1.0-MR1.jar:/Users/tlovell/.m2/repository/javax/mail/mail/1.4/mail-1.4.jar:/Users/tlovell/.m2/repository/javax/javaee-web-api/6.0/javaee-web-api-6.0.jar:/Users/tlovell/.m2/repository/junit/junit/4.8.1/junit-4.8.1.jar:/Users/tlovell/.m2/repository/com/idexx/applications/lynxx/swingclient/LYNXXCore/3.7.1.1-SNAPSHOT/LYNXXCore-3.7.1.1-SNAPSHOT.jar:/Users/tlovell/.m2/repository/backport-util-concurrent/backport-util-concurrent/3.1/backport-util-concurrent-3.1.jar:/Users/tlovell/.m2/repository/com/idexx/libs/core/SOACore/1.0.22/SOACore-1.0.22.jar:/Users/tlovell/.m2/repository/com/idexx/libs/core/I18NCore/1.0.12/I18NCore-1.0.12.jar:/Users/tlovell/.m2/repository/com/idexx/libs/core/JavaCore/1.0.14/JavaCore-1.0.14.jar:/Users/tlovell/.m2/repository/com/idexx/libs/core/SwingCore/1.1.21/SwingCore-1.1.21.jar:/Users/tlovell/Documents/Workspaces/LYNXX/SwingClient/LYNXXClient/target/LYNXXClient.jar:/Users/tlovell/.m2/repository/net/sf/jsr107cache/jsr107cache/1.1/jsr107cache-1.1.jar::/Users/tlovell/.m2/repository/org/apache/axis2/axis2-transport-http/1.5.1/axis2-transport-http-1.5.1.jar:/Users/tlovell/.m2/repository/org/apache/axis2/axis2-transport-local/1.5.1/axis2-transport-local-1.5.1.jar:/Users/tlovell/.m2/repository/org/apache/axis2/axis2-kernel/1.5.1/axis2-kernel-1.5.1.jar:/Users/tlovell/.m2/repository/commons-httpclient/commons-httpclient/3.1/commons-httpclient-3.1.jar:/Users/tlovell/.m2/repository/jaxen/jaxen/1.1.1/jaxen-1.1.1.jar:/Users/tlovell/.m2/repository/org/apache/ws/commons/axiom/axiom-api/1.2.9.1/axiom-api-1.2.9.1.jar:/Users/tlovell/.m2/repository/org/apache/xmlbeans/xmlbeans/2.3.0/xmlbeans-2.3.0.jar:/Users/tlovell/.m2/repository/com/bea/sdo/2.1.0/sdo-2.1.0.jar:/Users/tlovell/.m2/repository/commons-logging/commons-logging/1.1.1/commons-logging-1.1.1.jar:/Users/tlovell/.m2/repository/com/bea/dsp/ld-client/3.0/ld-client-3.0.jar:/Users/tlovell/.m2/repository/com/idexx/com.idexx.cache.impl.coherence/1.0.0.8/com.idexx.cache.impl.coherence-1.0.0.8.jar:/Users/tlovell/.m2/repository/com/idexx/com.idexx.cache/1.0.0.8/com.idexx.cache-1.0.0.8.jar:/Users/tlovell/.m2/repository/org/springframework/spring-context/2.5/spring-context-2.5.jar:/Users/tlovell/.m2/repository/org/springframework/spring-beans/2.5/spring-beans-2.5.jar:/Users/tlovell/.m2/repository/org/springframework/spring-core/2.5/spring-core-2.5.jar:/Users/tlovell/.m2/repository/com/oracle/coherence/com.oracle.coherence/3.5.1b461/com.oracle.coherence-3.5.1b461.jar:/Users/tlovell/.m2/repository/org/apache/ws/commons/axiom/axiom-impl/1.2.9.1/axiom-impl-1.2.9.1.jar:/Users/tlovell/.m2/repository/wsdl4j/wsdl4j/1.6.2/wsdl4j-1.6.2.jar:/Users/tlovell/.m2/repository/org/apache/ws/commons/schema/XmlSchema/1.4.3/XmlSchema-1.4.3.jar:/Users/tlovell/.m2/repository/org/apache/neethi/neethi/2.0.4/neethi-2.0.4.jar:/Users/tlovell/.m2/repository/org/apache/httpcomponents/httpcore/4.0/httpcore-4.0.jar:/Users/tlovell/.m2/repository/commons-codec/commons-codec/1.9/commons-codec-1.9.jar:/Users/tlovell/.m2/repository/org/jvnet/substance/5.1_01final/substance-5.1_01final.jar:/Users/tlovell/.m2/repository/org/jvnet/flamingo/flamingo/4.1/flamingo-4.1.jar:/Users/tlovell/.m2/repository/com/jidesoft/jide/jide-components/2.8.7/jide-components-2.8.7.jar:/Users/tlovell/.m2/repository/it/unimi/dsi/fastutil/7.0.12/fastutil-7.0.12.jar'
    let bin = a:java_home . "/bin/"
    exec('!rm target/classes/'.pd)
    exec('!'.bin.'javac -cp '.cp.' -d target/classes '.f)
    "exec('R java -Dtangosol.coherence.log.level=-1 -cp '.cp. ' '.pd)
    ":command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
    exec('!'.bin.'java -Dtangosol.coherence.log.level=-1 -cp '.cp. ' '.pd)
endfunction

function! GetPackageDirectory (f)
    return split(split(a:f,"src/main/java/")[-1],'\.')[0]
endfunction

command! -nargs=* GruntApexSave call GruntApexSave()




python << EOF
def hook(row,col):
    snippet = None
    #unravel snips w same end
    while UltiSnips_Manager._cs and UltiSnips_Manager._cs != snippet:
        snippet = UltiSnips_Manager._cs
        UltiSnips_Manager.expand_or_jump()
        if UltiSnips_Manager._cs:
            end = snippet.end
            if vim.current.window.cursor[0] == end[0] + 1 and vim.current.window.cursor[1] == end[1] and UltiSnips_Manager._cs != snippet:
                continue
    return ''
def check_move():
    import re
    cursor = vim.current.window.cursor
    col = cursor[1]-1
    row = cursor[0]-1

    UltiSnips_Manager.expand()
    if vim.vars['ulti_expand_res'] == 0:
        line = vim.current.buffer[row][col:]
        if len(line) == 0 or line[0] == ' ':
            if len(line):
                #vim.vars['tadaa_feed']='\'feedkeys("\<c-j>")\''
                #vim.vars['tadaa_feeda']='"\<c-j>"'
                #vim.vars['tadaa_feedb']='"\<BS>"'
                #vim.vars['test']='pyeval("hook('+str(row)+','+str(col)+')")'
                vim.eval('feedkeys("\<bs>")')
                vim.eval('feedkeys("\<space>\<bs>\<right>\<C-R>=pyeval(\'hook('+str(row)+','+str(col)+')\')\<CR>")')
            else:
                UltiSnips_Manager.expand_or_jump()
        else:
            vim.current.window.cursor = (row+1,col+1)
            vim.eval('feedkeys("\<space>")')
EOF

function! Expand (var)
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        return a:var
    endif
    return ''
endfunction




function! ExpandOrJump ()
python << EOF
check_move()
EOF
return ''
endfunction

function! CommaSnip ()
python << EOF
cursor = vim.current.window.cursor
col = cursor[1]-1
row = cursor[0]-1
buffer = vim.current.window.buffer[row]
if len(buffer) > 0 and buffer[col] == ',':
    vim.current.window.buffer[row]=buffer[:col] + buffer[col+1:]
    vim.vars['tadaa_regex_res']=1
else:
    vim.vars['tadaa_regex_res']=0
EOF
if g:tadaa_regex_res
    return '/'
endif
return ','
endfunction


function! GruntApexSave () 
    if exists(":ApexSave") == 0
        let f = &ft
        set ft=apexcode
        let &ft=f
    endif
    exec("!grunt")
    let old_bufnum = bufnr('')
    execute 'hide view src/package.xml'
    let del_bufnum = bufnr('')
    execute 'ApexSave'
    execute 'buffer '.old_bufnum
    execute 'bdelete '.del_bufnum
endfunction

if has("gui_running")
  if has("win32")
      Bundle 'YouCompleteMe_Win32'
      "TODO put in custom dependencies
      set guioptions-=T
      let g:agprg=g:user_vim_dir.'dependencies/windows/ag/ag.exe --column' "AG
      let g:apex_binary_tee="C:/MinGW/msys/1.0/bin/tee.exe"
      let g:apex_binary_tee="C:/MinGW/msys/1.0/bin/touch.exe"
      let &backupdir=g:user_vim_dir.'backup'
      let &directory=g:user_vim_dir.'swap'
      set guifont=anonymous\ pro:h10:w5.6
      " Open the folder containing the currently open file. Double <CR> at end
      " is so you don't have to hit return after command. Double quotes are
      " not necessary in the 'explorer.exe %:p:h' section.
      "imap <C-j> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR><C-space>
      inoremap <silent> / <C-R>=ExpandOrJump()<cr>
      inoremap <silent> , <C-R>=CommaSnip()<CR>
      xnoremap <silent> / :call UltiSnips#SaveLastVisualSelection()<cr>gvs
      vnoremap <silent> / <ESC>:call UltiSnips#ExpandSnippetOrJump()<CR><c-space>
      "inoremap <silent> <c-j> <C-R>=ExpandOrJump()<cr>
      "xnoremap <silent> <c-J> :call UltiSnips#SaveLastVisualSelection()<cr>gvs
      imap 0 <C-R>=Expand(0)<CR><C-space>
      imap 1 <C-R>=Expand(1)<CR><C-space>
      imap 9 <C-R>=Expand(9)<CR><C-space>

      :map <silent> <C-F5> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
  else
      Bundle 'Valloric/YouCompleteMe'
      let g:UltiSnipsExpandSnippetOrJump = "UltiSnips#ExpandSnippetOrJump"
      let &backupdir=g:user_vim_dir.'backup'
      let &directory=g:user_vim_dir.'swap'
      set guifont=anonymous\ pro:h12
      set lsp=3
      inoremap <silent> / <C-R>=ExpandOrJump()<CR>
      inoremap <silent> , <C-R>=CommaSnip()<CR>
      xnoremap <silent> / :call UltiSnips#SaveLastVisualSelection()<cr>gvs
      vnoremap <silent> / <ESC>:call UltiSnips#ExpandSnippetOrJump()<CR><c-space>
      "inoremap <silent> <c-j> <C-R>=ExpandOrJump()<cr>
      "xnoremap <silent> <c-J> :call UltiSnips#SaveLastVisualSelection()<cr>gvs
      "imap / <c-j>
      "imap <c-j> <C-R>=ExpandOrJump()<CR><C-space>
      imap 0 <C-R>=Expand(0)<CR><C-space>
      imap 1 <C-R>=Expand(1)<CR><C-space>
      imap 9 <C-R>=Expand(9)<CR><C-space>
  endif
endif
