if exists('g:async_complete_loaded')
	echo 'Error:async_complete already loaded'
	finish
endif
if !has('python')
	echo 'Error:Required vim compiled with +python'
	finish
endif

let g:async_complete_loaded = 1

function! AsyncComplete#WrapCompleteFunc ()
endfunction

au! FileType * call AsyncComplete#WrapCompleteFunc


