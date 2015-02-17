if !has('python')
	finish
endif
if !exists('g:visualforce_complete_use_omnifunc')
	let g:visualforce_complete_use_omnifunc=0
endif
let s:recalled = 0

python << EOF
import completer,vim
completer.addSymbolsFromFile('html',vim.eval('g:visualforce_plugin_current_directory')+'/completions/html.json')
completer.addSymbolsFromFile('svg',vim.eval('g:visualforce_plugin_current_directory')+'/completions/svg.json')
completer.handleType('html',['html','svg'])
completer.handleType('svg',['svg'])
#Completer.handleType('vfp',['visualforce','html','svg'])
#Application.setup({ "completions" : { "html": ["completions/html.json"], "svg": ["completions/svg.json"], "visualforce": ["completions/visualforce.json","completions/visualforce.py"], } "semicolon_fix" : False })
EOF

function! visualforce#Complete(findstart,base)
if a:findstart
    "let l:line = line('.') - 1
    let l:project=resolve(expand('%:p:h').'/..')
    let l:type=&ft
    let l:buffer_name=resolve(expand('%:p'))
    let l:line = line('.') - 1
    let l:column = col('.') - 1
    "let l:base = a:base

" never a situation where we don't want to complete and we want highest
" accuracy
python << EOF
import sys,vim
import completer
#visualforce = reload(visualforce)
result = completer.getCompletions(line=int(vim.eval('l:line')),column=int(vim.eval('l:column')),project=vim.eval('l:project'),type=vim.eval('l:type'),name=vim.eval('l:buffer_name'),buffer=vim.current.buffer)
vim.command('let s:c_result= %s'% result)
EOF
return s:c_result['column_start']
endif
return s:c_result

endfunction
