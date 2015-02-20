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
Bundle 'SirVer/ultisnips'
Bundle 'neowit/vim-force.com'
Bundle 'ciaranm/detectindent'
Bundle 'Jonty/svnblame.vim'
Bundle 'cocopon/iceberg.vim'
Bundle 'reedes/vim-colors-pencil'
Bundle 'TaDaa/vim-emmet-autocompleter'
Bundle 'TaDaa/vim-emmet-visualforce-autocompleter'
"Bundle 'emmet-completions'
"Bundle 'emmet-completions-visualforce'
"Bundle 'tadaa'
"Bundle 'async-complete'

filetype on
filetype plugin on 
filetype indent on
cd /IDEXX/projects/trunk/src/main/webapp "current working directory
"cd /IDEXX/projects/ForceTadaa "current working directory

autocmd FileType scss syn cluster sassCssAttributes add=@cssColors "VIM-CSS-COLOR
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

let g:NERDTreeChDirMode=2 "NERDTree
let g:NERDTreeMapOpen='<CR>' "NERDTree
let g:NERDTreeMapPreview='<S-CR>' "NERDTree
let g:NERDTreeMapOpenSplit='<C-x>' "NERDTree
let g:NERDTreeMapPreviewSplit='px' "NERDTree
let g:NERDTreeMapOpenVSplit='<C-v>' "NERDTree
let g:NERDTreeMapPreviewVSplit='pv' "NERDTree
let g:ctrlp_working_path_mode = '0' "CTRLP
let g:ctrlp_custom_ignore = { 
	\ 'dir' : '\v[\/](\.svn|\.git|\.hg|\.sencha|\.sass-cache|build|fa|webapp/ext|webapp/touch|images|icons|docs|deft|fonts|assembly|test)$'
\ } "CTRLP
let g:aghighlight=1 "AG
let g:agformat="%f:%l:%c:%m" "AG
"let g:ycm_server_keep_logfiles=1
"let g:ycm_server_log_level='debug'
let g:ycm_global_ycm_extra_conf= g:user_vim_dir.'custom/ycm/.ycm_extra_conf.py'
let g:EclimCompletionMethod = 'omnifunc' "YCM
let g:EclimJavascriptLintConf=g:user_vim_dir.'custom/Eclim/jslint.conf' "ECLIM validation
let g:UltiSnipsExpandTrigger="<NUL>"  "ULTISNIPS
let g:UltiSnipsJumpForwardTrigger="<NUL>" "ULTISNIPS
let g:UltiSnipsJumpBackwardTrigger="<c-k>" "ULTISNIPS
let delimitMate_expand_cr=1
let g:emmet_completions_use_omnifunc=1 "vim-emmet-autocompleter
let g:apex_server=1 "force
let g:apex_server_timeoutSec=60*30


let g:apex_backup_folder="~/force/backup"
let g:apex_temp_folder="~/force/temp"
let g:apex_properties_folder="~/force"
"let g:apex_tooling_force_dot_com_path=g:user_vim_dir.'\\dependencies\\windows\\force\\tooling-force.com-0.3.1.6.jar'
"let g:apex_tooling_force_dot_com_path=g:user_vim_dir.'\\dependencies\\windows\\force\\tooling-force.com-0.3.1.6a.jar'
"let g:apex_tooling_force_dot_com_path='C:/IDEXX/projects/git/tooling-force.com/target/scala-2.10/tooling-force.com-assembly-0.1-SNAPSHOT.jar'
let g:ycm_semantic_triggers = {
\	'visualforce' : ['<',':',']','}','>','^',' ','','['],
\	'vfp' : ['<',']','}','>','^','[','+', ' '],
\	'apex' : ['<','.'],
\	'apexcode' : ['<','.'],
\	'html' : ['<',']','}','>','^','[','+', ' '],
\	'svg' : ['<',']','}','>','^','[','+', ' ']
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

set cot=menu,longest,preview,menuone
set encoding=utf-8
set anti

colorscheme hemisu
hi LineNr guifg=#555555
hi Normal guibg=#012333 guifg=#eeeeee	
hi Visual guibg=#555555

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
EOF


silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'

"SPECIAL ECLIPSE COMMAND  -- open in eclipse
command! -nargs=* EclipseOpen call EclipseOpen(<f-args>)

function! EclipseOpen (...) 
    if a:0
        let f=getcwd()."/".a:1
    else
        let f=expand('%')
    endif
    exec("!open -a Eclipse ".f)
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
      imap <C-j> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR><C-space>
      :map <silent> <C-F5> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
  else
      Bundle 'Valloric/YouCompleteMe'
      let g:UltiSnipsExpandSnippetOrJump = "UltiSnips#ExpandSnippetOrJump"
      let &backupdir=g:user_vim_dir.'backup'
      let &directory=g:user_vim_dir.'swap'
      set guifont=anonymous\ pro:h12
      set lsp=3
      imap <C-j> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR><C-space>
  endif
endif
