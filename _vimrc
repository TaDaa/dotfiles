"NOTES 
"- tsserver installed global
"- vue-language-server installed global ... make script
"- python3 installed global
"Ag The SilverSearcher installed global
"fd installed global
"force py3
py3 ""
let g:py_cmd = "py"
if has('python3')
    let g:py_cmd = "py3"
endif
let g:arr_esc="\<c-[>"
let g:tsuquyomi_use_vimproc=1
let g:tsuquyomi_disable_quickfix = 1
let g:user_vim_dir=fnamemodify("~/.vim",":p") "full path to vim files
if has("win32")
    source $VIMRUNTIME/mswin.vim
    syntax on
    let g:user_vim_dir=substitute(g:user_vim_dir,'/','\\','g')
endif
set nocompatible
behave mswin
let &runtimepath.=",".g:user_vim_dir."custom"
let &runtimepath.=",".g:user_vim_dir."dependencies"
set rtp-='~/vimfiles'
filetype off
let &runtimepath.=",".g:user_vim_dir."bundle/vundle"
silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'

call vundle#rc()

"preload eclim
Bundle 'vimfiles/eclim'
Bundle 'vimfiles'
Bundle 'gmarik/vundle'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/emmet-vim'
Bundle 'skammer/vim-css-color'
Bundle 'rking/ag.vim'
Bundle 'joshdick/onedark.vim'
Bundle 'SirVer/ultisnips'
Bundle 'nixprime/cpsm'
Bundle 'tpope/vim-sleuth'
Bundle 'TaDaa/vim-emmet-autocompleter'
Bundle 'TaDaa/vim-emmet-visualforce-autocompleter'
Bundle 'TaDaa/vim-emmet-android-autocompleter'
"Bundle 'TaDaa/vim-sourcekitten'
Bundle 'pangloss/vim-javascript'
Bundle 'w0rp/ale'
Bundle 'mg979/vim-visual-multi'
Bundle 'airblade/vim-gitgutter'
Bundle 'itchyny/lightline.vim'
"Bundle 'posva/vim-vue'
Bundle 'storyn26383/vim-vue'
Bundle 'keith/swift.vim'
"Bundle 'morhetz/gruvbox'
"Bundle 'vim-scripts/candycode.vim'
"Bundle 'vim-scripts/summerfruit256.vim'
"Bundle 'vim-scripts/pyte'
"Bundle 'vim-scripts/moria'
"Bundle 'vim-scripts/ironman.vim'
"Bundle 'vim-scripts/louver.vim'
"Bundle 'NLKNguyen/papercolor-theme'
"Bundle 'kristijanhusak/vim-hybrid-material'
"Bundle 'cocopon/iceberg.vim'
"Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'gosukiwi/vim-atom-dark'
"Bundle 'chriskempson/base16-vim'
"Bundle 'tomasr/molokai'
"Bundle 'danilo-augusto/vim-afterglow'
"Bundle 'nielsmadan/harlequin'
"Bundle 'nanotech/jellybeans.vim'
"Bundle 'twerth/ir_black'
"Bundle 'w0ng/vim-hybrid'
"Bundle 'noahfrederick/vim-hemisu'
"Bundle 'reedes/vim-colors-pencil'
"Bundle 'sjl/badwolf'
"Bundle 'rakr/vim-one'
"Bundle 'ayu-theme/ayu-vim'
"Bundle 'drewtempelmeyer/palenight.vim'
"Bundle 'sonph/onehalf', {'rtp': 'vim/'}
"Bundle 'neowit/vim-force.com'
"Bundle 'maksimr/vim-jsbeautify'
"Bundle 'ciaranm/detectindent'
"Bundle 'juneedahamed/vc.vim'
"Bundle 'oplatek/Conque-Shell'
"Bundle 'greyblake/vim-preview'
"Bundle 'Shougo/vimproc.vim'
"Bundle 'Quramy/tsuquyomi'
"Bundle 'jerrymarino/iCompleteMe' "requires compilationdatabase
"Bundle 'jerrymarino/XcodeCompilationDatabase'
"Bundle 'HerringtonDarkholme/yats.vim'


"PLUGIN CONFIG
"ALE -- disabled because I am manually triggering due to performance reasons
ALEDisable 
let g:ale_completion_enabled = 1
let g:ale_linters = {
  \ "sh": ["language_server"],
  \ }
"lightline
let g:lightline = {}
let g:lightline.enable = {'statusline': 1, 'tabline': 1}
let g:lightline.colorscheme = 'wombat'
"NERDTREE
let g:NERDTreeChDirMode=2
let g:NERDTreeMapOpen='<CR>'
let g:NERDTreeMapPreview='<S-CR>'
let g:NERDTreeMapOpenSplit='<C-x>'
let g:NERDTreeMapPreviewSplit='px'
let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapPreviewVSplit='pv'
"CTRLP
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = { 
	\ 'dir' : '\v[\/](LYNXXLogs|target|bin|\.DS_STORE|\.settings|\.svn|\.git|\.hg|\.sencha|\.sass-cache|build|fa|webapp/ext|webapp/touch|images|icons|docs|deft|fonts|assembly|test|classes|debug|node_modules)$'
\ }
"AG
let g:aghighlight=1
let g:agformat="%f:%l:%c:%m"
"ECLIM
let g:EclimCompletionMethod = 'omnifunc' "makes eclim work with youcompleteme
let g:EclimJavascriptLintConf=g:user_vim_dir.'custom/Eclim/jslint.conf'
"ULTISNIPS
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsMappingsToIgnore=['/']
"DELIMITMATE
let delimitMate_expand_cr=1
"TADAA EMMET_COMPLETIONS
let g:emmet_completions_use_omnifunc=1
"TADAA SOURCEKITTEN
let g:sourcekitten_use_omnifunc=1
"SALES FORCE - APEX
let g:apex_server=1
let g:apex_server_timeoutSec=60*30
let g:apex_backup_folder="/Users/tlovell/.force/backup"
let g:apex_temp_folder="/Users/tlovell/.force/temp"
let g:apex_properties_folder="/Users/tlovell/.force"
let g:apex_tooling_force_dot_com_path=g:user_vim_dir.'/dependencies/shared/force/tooling-force.com-0.3.3.2.jar'
"let g:apex_tooling_force_dot_com_path=g:user_vim_dir.'\\dependencies\\windows\\force\\tooling-force.com-0.3.1.6a.jar'
"let g:apex_tooling_force_dot_com_path='C:/IDEXX/projects/git/tooling-force.com/target/scala-2.10/tooling-force.com-assembly-0.1-SNAPSHOT.jar'
"MULTI CURSOR
let g:multi_cursor_normal_maps={'!':1, '@':1, '=':1, 'q':1, 'r':1, 't':1, 'T':1, 'y':1, '[':1, ']':1, '\':1, 'd':1, 'f':1, 'F':1, 'g':1, '"':1, 'z':1, 'c':1, 'm':1, '<':1, '>':1}
let g:multi_cursor_visual_maps={'F':1,'f':1}
"YOUCOMPLETEME
let g:ycm_global_ycm_extra_conf= g:user_vim_dir.'custom/ycm/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'java,javascript,typescript,d,python,perl6,scala,vb,elixir,go,vue' : ['.'],
  \   'groovy' : ['.'],
  \   'cs' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'html' : ['[', ' ', '<','>', '+', '*', ']', '^'],
  \   'svg' : ['[', ' ', '<', '>', '+', '*', ']', '^'],
  \   'swift' : [']', '?', '.']
  \ }
let g:vim_vue_indent_paths = {
  \ 'javascript': '../vim-javascript/indent/javascript.vim' 
  \ }


" USER SPECIFIED
filetype on
filetype plugin on 
filetype indent on
set statusline+=%#warningmsg#
set statusline+=%*
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
set laststatus=2                             " always show statusbar  
set statusline=[%.n]%m\ %f%=%<%P
set signcolumn=yes
:command Bd bd

if has ("nvim")
    syntax on
else
    Bundle 'roxma/nvim-yarp'
    Bundle 'roxma/vim-hug-neovim-rpc'
endif

if has("win32")
  Bundle 'YouCompleteMe_Win32'
  set guioptions-=T
  let g:agprg=g:user_vim_dir.'dependencies/windows/ag/ag.exe --column' "AG
  let g:apex_binary_tee="C:/MinGW/msys/1.0/bin/tee.exe"
  let g:apex_binary_tee="C:/MinGW/msys/1.0/bin/touch.exe"
  let &backupdir=g:user_vim_dir.'backup'
  let &directory=g:user_vim_dir.'swap'
  set guifont=anonymous\ pro:h10:w5.6
  "ExpandOrJump and CommaSnip below
  inoremap <silent> / <C-R>=ExpandOrJump()<CR>
  inoremap <silent> , <C-R>=CommaSnip()<CR>
  snoremap / <ESC>:call UltiSnips#ExpandSnippetOrJump()<CR>

  :map <silent> <C-F5> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
else
  Bundle 'Valloric/YouCompleteMe'
  "set shortmess+=c
  set completeopt = menu,preview,noselect
  inoremap <c-c> <ESC>
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

  " Use <TAB> to select the popup menu:
  "inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  "inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  let g:UltiSnipsExpandSnippetOrJump = "UltiSnips#ExpandSnippetOrJump"
  let &backupdir=g:user_vim_dir.'backup'
  let &directory=g:user_vim_dir.'swap'
  set guifont=anonymous\ pro:h13
  set lsp=3
  "ExpandOrJump and CommaSnip below
  inoremap <silent> / <C-R>=ExpandOrJump()<CR>
  inoremap <silent> , <C-R>=CommaSnip()<CR>
  snoremap / <ESC>:call UltiSnips#ExpandSnippetOrJump()<CR>
endif
"UltiSnips custom helpers
exec g:py_cmd join(readfile(expand('~/.vim/config.py')), "\r")
function! Expand (var)
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        return a:var
    endif
    return ''
endfunction
function! ExpandOrJump ()
    exec g:py_cmd "check_move()"
    return g:tadaa_check_move_res
endfunction
function! CommaSnip ()
    exec g:py_cmd "checkComma()"
    if g:tadaa_regex_res
        return '/'
    endif
    return ','
endfunction

"autocmd FileType scss syn cluster sassCssAttributes add=@cssColors "VIM-CSS-COLOR

"KEYBINDINGS
"visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
"REMAP
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>ct :call NERDComment(0,"toggle")<CR>
vnoremap <Leader>ct :call NERDComment(0,"toggle")<CR>
imap <c-l> <right>
imap <c-h> <left>
tnoremap <ESC> <C-W>N "rebind ESC to terminal-normal


"AUTOCMDS
autocmd FileType scss syn cluster sassCssAttributes add=@cssColors "VIM-CSS-COLOR
autocmd BufEnter * call BuffEnter()
function BuffEnter ()
    set smarttab
    set smartindent
    NERDTreeMirror
endfunction
hi NonText guibg=#111122 guifg=#444466
autocmd VimEnter * call VimEnter()
let &ft=javascript
function VimEnter ()
    colorscheme onedark
    hi SpellBad gui=undercurl
    hi Normal guibg=#171b23
    hi DiffChange guibg=#232c45 guifg=NONE gui=NONE
    hi DiffText guibg=#202087 guifg=NONE gui=NONE
    hi DiffAdd guibg=#105501 guifg=NONE gui=NONE
    hi DiffDelete guibg=#cd1010 guifg=#cd1010 gui=NONE
    hi VertSplit guifg=#000000
    NERDTree
    wincmd w
endfunction

autocmd FileType typescript,javascript,vue set omnifunc= "unset omnifunc to allow youCompleteMe and ALE to take precedence
autocmd TextChanged,TextChangedI * call TextChanged()
let g:tadaa_gitgutter_timer = 0
let g:tadaa_gitgutter_delay = 1000
let g:tadaa_ale_timer = 0
let g:tadaa_ale_delay = 1000
function Timer_GitGutter (arg1)
    GitGutter
    let g:tadaa_gitgutter_timer = 0
endfunction
function Timer_ALELint (arg1)
    ALELint
    let g:tadaa_ale_timer = 0
endfunction
function TextChanged ()
    if g:tadaa_gitgutter_timer != 0
        call timer_stop(g:tadaa_gitgutter_timer)
    endif
    if g:tadaa_ale_timer != 0
        call timer_stop(g:tadaa_ale_timer)
    endif
    let g:tadaa_gitgutter_timer = timer_start(g:tadaa_gitgutter_delay, 'Timer_GitGutter')
    let g:tadaa_ale_timer = timer_start(g:tadaa_ale_delay, 'Timer_ALELint')
endfunction



"
"COMMANDS
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


"LYNXX Command to compile Java Buffer
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
    exec('!'.bin.'java -Dtangosol.coherence.log.level=-1 -cp '.cp. ' '.pd)
endfunction
function! GetPackageDirectory (f)
    return split(split(a:f,"src/main/java/")[-1],'\.')[0]
endfunction


"Javascript/Typescript LintFix
command! LintFix call LintFix()
function! LintFix ()
    if &ft == "typescript"
        execute("!tslint --fix ".@%)
    elseif &ft == "javascript"
        execute("!eslint --fix ".@%)
    endif
endfunction

"Old SalesForce command..probably just delete this
command! -nargs=* GruntApexSave call GruntApexSave()
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
