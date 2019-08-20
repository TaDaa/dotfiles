"NOTES 
"TODO - need to update my code in here to work right with Vundle (missing - begining + end)
"- tsserver installed global
"- vue-language-server installed global ... make script
"- python3 installed global
"Ag The SilverSearcher installed global
"fd installed global
"force py3
let g:py_cmd = "py3"
let g:IS_TERM = !has('gui_running')

if has('python3')
    let g:py_cmd = "py3"
endif
let g:arr_esc="\<c-[>"

let g:user_vim_dir=fnamemodify("~/.vim",":p") "full path to vim files
if has("win32")
    source $VIMRUNTIME/mswin.vim
    syntax on
    let g:user_vim_dir=substitute(g:user_vim_dir,'/','\\','g')
endif
if has("gui")
  set ambiwidth=single
  if has("win32")
    set guifont=OperatorMonoNerdFont-Light:h10
  else
    set guifont=OperatorMonoNerdFont-Light:h13
  endif
  if !has('nvim')
    function! SetTransparency(a)
      set transparency=1
    endfunction
    function! ForceRedraw()
      "TODO try to move this..some of the icons were bugging out
      if has("win32")
        set guifont=OperatorMonoNerdFont-Light:h10
      else
        set guifont=OperatorMonoNerdFont-Light:h13
      endif
      call timer_start(1, 'SetTransparency')
    endfunction
  endif
endif
set nocompatible
behave mswin
let &runtimepath.=",".g:user_vim_dir."custom"
let &runtimepath.=",".g:user_vim_dir."dependencies"
set rtp-='~/vimfiles'
filetype off

execute "source ".g:user_vim_dir."plugged/vim-plug/plug.vim"
silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'unblevable/quick-scope'
"Plug 'easymotion/vim-easymotion'
"Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Bundle 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
"Plugin 'alvan/vim-closetag'
"Plugin 'tpope/vim-endwise'
"Bundle 'jiangmiao/auto-pairs'
"Plugin 'Raimondi/delimitMate'
Plug 'tmsvg/pear-tree'
Plug 'mattn/emmet-vim'
"Bundle 'skammer/vim-css-color'
Plug 'rking/ag.vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-sleuth'
"Bundle 'TaDaa/vim-emmet-autocompleter'
"Bundle 'TaDaa/vim-emmet-visualforce-autocompleter'
"Bundle 'TaDaa/vim-emmet-android-autocompleter'
Plug 'TaDaa/vimade'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'mg979/vim-visual-multi'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'maksimr/vim-jsbeautify'
"Bundle 'ciaranm/detectindent'
Plug 'HerringtonDarkholme/yats.vim' "typescript highlighting
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.vim'
"Bundle 'severin-lemaignan/vim-minimap'
Plug 'junegunn/goyo.vim'
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
"Plug 'shougo/deoplete.nvim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'severin-lemaignan/vim-minimap'
call plug#end()
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_highlight_on_keys = ['f', 'F']

"call deoplete#custom#option({
  "\ 'auto_complete_delay': 50,
  "\ 'auto_refresh_delay': 25,
  "\ 'min_pattern_length': 0,
"\ })
"call deoplete#custom#source('ale','input_pattern', '.')
"call deoplete#custom#source('ale','input_pattern', '.')
"call deoplete#custom#source('ale', {'rank':10000})

"let g:deoplete#sources = {'php': ['ale','buffer']}
"let g:deoplete#enable_at_startup = 1

let g:pear_tree_repeatable_expand=0


"TODO remove
let g:coc_force_debug = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
"
set notermguicolors
let g:vimade = {}
let g:vimade.enablesigns = 1
let g:vimade.detecttermcolors = 0
let g:vimade.signsretentionperiod = 4000
let g:vimade.enablefocusfading=1
"PLUGIN CONFIG
"ALE -- disabled because I am manually triggering due to performance reasons
"try
  "ALEDisable 
"catch
  "echo ''
"endtry  
let g:NERDTreeUpdateOnCursorHold = 0
let g:ale_sourcekit_lsp_executable = '/Users/tlovell/Documents/workspace/sourcekit-lsp/.build/x86_64-apple-macosx/debug/sourcekit-lsp'
let g:ale_php_langserver_executable = '/Users/tlovell/.composer/vendor/felixfbecker/language-server/bin/php-language-server.php'
let g:ale_php_langserver_use_global = 1
let g:ale_completion_enabled = 0
let g:ale_linters = {
  \ "sh": ["language_server"],
  \ "php": ["langserver"],
  \ }
"lightline
let g:lightline = {}
let g:lightline.component_function = {'filetype': 'GetLightlineFileType', 'fileformat': 'GetLightlineFileFormat'}
function! GetLightlineFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() . '' : 'no ft') : ''
endfunction

function! GetLightlineFileFormat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol() . '') : ''
endfunction
let g:lightline.enable = {'statusline': 1, 'tabline': 1}
let g:lightline.colorscheme='wombat'
"NERDTREE
let g:NERDTreeChDirMode=2
let g:NERDTreeMapOpen='<CR>'
let g:NERDTreeMapPreview='<S-CR>'
let g:NERDTreeMapOpenSplit='<C-x>'
let g:NERDTreeMapPreviewSplit='px'
let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapPreviewVSplit='pv'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✹",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"
"AG
let g:aghighlight=1
let g:agformat="%f:%l:%c:%m"
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

"YOUCOMPLETEME
"let g:ycm_global_ycm_extra_conf= g:user_vim_dir.'custom/ycm/.ycm_extra_conf.py'
"let g:ycm_min_num_of_chars_for_completion = 0
"let g:ycm_semantic_triggers =  {
  "\   'c' : ['->', '.'],
  "\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  "\             're!\[.*\]\s'],
  "\   'ocaml' : ['.', '#'],
  "\   'cpp,objcpp' : ['->', '.', '::'],
  "\   'perl' : ['->'],
  "\   'php' : ['->', '::'],
  "\   'java,javascript,typescript,d,python,perl6,scala,vb,elixir,go,vue' : ['.'],
  "\   'groovy' : ['.'],
  "\   'cs' : ['.'],
  "\   'ruby' : ['.', '::'],
  "\   'lua' : ['.', ':'],
  "\   'erlang' : [':'],
  "\   'html' : ['[', ' ', '<','>', '+', '*', ']', '^'],
  "\   'svg' : ['[', ' ', '<', '>', '+', '*', ']', '^'],
  "\   'swift' : [']', '?', '.']
  "\ }

"let g:vim_vue_indent_paths = {
  "\ 'javascript': '../vim-javascript/indent/javascript.vim' 
  "\ }

"webicons
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_conceal_nerdtree_brackets=1
let g:WebDevIconsNerdTreeBeforeGlyphPadding=''
let g:WebDevIconsNerdTreeAfterGlyphPadding= g:IS_TERM ? ' ' : ''
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:DevIconsEnableFoldersOpenClose=1


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

syntax on

if has("win32")
  set guioptions-=T
  let g:agprg=g:user_vim_dir.'dependencies/windows/ag/ag.exe --column' "AG
  let g:apex_binary_tee="C:/MinGW/msys/1.0/bin/tee.exe"
  let g:apex_binary_tee="C:/MinGW/msys/1.0/bin/touch.exe"
  let &backupdir=g:user_vim_dir.'backup'
  let &directory=g:user_vim_dir.'swap'
  "ExpandOrJump and CommaSnip below
  inoremap <silent> / <C-R>=ExpandOrJump()<CR>
  inoremap <silent> , <C-R>=CommaSnip()<CR>
  snoremap / <ESC>:call UltiSnips#ExpandSnippetOrJump()<CR>

  :map <silent> <C-F5> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
else
  set completeopt=menu,preview,noselect
  set lsp=1
  inoremap <c-c> <ESC>
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

  let g:UltiSnipsExpandSnippetOrJump = "UltiSnips#ExpandSnippetOrJump"
  let &backupdir=g:user_vim_dir.'backup'
  let &directory=g:user_vim_dir.'swap'
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
nnoremap <c-p> :call OpenFZF()<CR>
function! OpenFZF()
  FZF
  "call FZFWithDevIcons()
  let b:FZF = 1
endfunction

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>ci :call NERDComment(0,"toggle")<CR>
vnoremap <Leader>ci :call NERDComment(0,"toggle")<CR>

function! TerminalNormal()
  if exists('b:FZF')
    :q!
  endif
endfunction

imap <c-l> <right>
imap <c-h> <left>
tnoremap <ESC> <C-\><C-N>:call TerminalNormal()<CR>



"AUTOCMDS
autocmd FileType scss syn cluster sassCssAttributes add=@cssColors "VIM-CSS-COLOR
autocmd BufEnter,BufNew *.tsx set ft=typescript
autocmd BufEnter * call BuffEnter()

function BuffEnter ()
    set smarttab
    set smartindent
    "NERDTreeMirror
endfunction
hi NonText guibg=#111122 guifg=#444466
autocmd VimEnter * call VimEnter()
function VimEnter ()
    if has('transparency')
      set transparency=1
    endif
    if g:IS_TERM
      set termguicolors
    endif
    VimadeOverrideFolded
    colorscheme onedark
    hi SpellBad gui=undercurl guibg=NONE
    hi ColorColumn guibg=NONE guifg=#555566
    hi Normal guibg=#171b23
    hi NonText guifg=#171b23
    hi DiffChange guibg=#232c45 guifg=NONE gui=NONE
    hi DiffText guibg=#202087 guifg=NONE gui=NONE
    hi DiffAdd guibg=#105501 guifg=NONE gui=NONE
    hi DiffDelete guibg=#cd1010 guifg=#cd1010 gui=NONE
    hi VertSplit guifg=#223322
   "this fixes status line icons not showing or cutoff
    hi LightlineRight_active_2 guifg=#ABB2BF
    filetype plugin on 
    NERDTree
    call webdevicons#refresh()
    wincmd w

endfunction

autocmd FileType typescript,javascript,vue set omnifunc= "unset omnifunc to allow youCompleteMe and ALE to take precedence

"autocmd TextChanged,TextChangedI * call TextChanged()
"let g:tadaa_gitgutter_timer = 0
"let g:tadaa_gitgutter_delay = 1000
"let g:tadaa_ale_timer = 0
"let g:tadaa_ale_delay = 1000
"function Timer_GitGutter (arg1)
    "GitGutter
    "let g:tadaa_gitgutter_timer = 0
"endfunction
"function Timer_ALELint (arg1)
    "ALELint
    "let g:tadaa_ale_timer = 0
"endfunction

"call timer_start(1000, 'Timer_GitGutter', {'repeat': -1})
"au! CursorHold * GitGutter
"function TextChanged ()
    "if g:tadaa_gitgutter_timer != 0
        "call timer_stop(g:tadaa_gitgutter_timer)
    "endif
    "if g:tadaa_ale_timer != 0
        "call timer_stop(g:tadaa_ale_timer)
    "endif
    "let g:tadaa_gitgutter_timer = timer_start(g:tadaa_gitgutter_delay, 'Timer_GitGutter')
    "let g:tadaa_ale_timer = timer_start(g:tadaa_ale_delay, 'Timer_ALELint')
"endfunction



"
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

"startify + devIcons
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

"FZF + devicons
function! FZFWithDevIcons()
  function! s:files()
    let files = split(system('fd --type f --exclude node_modules'), '\n')
    call s:prepend_icon(files)
    return l:files
  endfunction

  function! s:prepend_icon(candidates)
    let result = a:candidates 
    let i = 0
    for candidate in result
      "let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(fnamemodify(candidate, ':p:t'), 0)
      let result[i] = icon . ' ' . candidate
      let i = i + 1
    endfor
  endfunction

  function! s:edit_file(items)
    let items = a:items
    let i = 1
    let ln = len(items)
    while i < ln
      let item = items[i]
      let parts = split(item, ' ')
      let file_path = get(parts, 2, '')
      let items[i] = file_path
      let i += 1
    endwhile
    call s:Sink(items)
  endfunction

  let opts = fzf#wrap({})
  let opts.source = <sid>files()
  let s:Sink = opts['sink*']
  let opts['sink*'] = function('s:edit_file')
  call fzf#run(opts)
endfunction

if has('gui_running') == 0 && has('nvim') == 0
   call feedkeys(":silent execute '!' | redraw!\<CR>")
endif
