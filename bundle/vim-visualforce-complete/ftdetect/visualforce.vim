let g:visualforce_complete_use_omnifunc=0

au BufNewFile,BufRead *.page,*.vfp set ft=vfp
au BufNewFile,BufRead *.component,*.vfc set ft=vfc
au! fileType vfp,vfc call s:setCompleter()


"au BufNewFile,BufRead *.test set ft=test
"au! fileType test set omnifunc=TestCompleter


"function! TestCompleter(findstart,base) 
    "if a:findstart
        "return 1
    "endif
    "return [{"abbr":"test1:test1","word":"test1:test1"},{"abbr":"test2:test2","word":"test2:test2"},{"abbr":"test3:test3","word":"test4:test4"},{"abbr":"test4:test4","word":"test5:test"}]
"endfunction



function! s:setCompleter ()
	if g:visualforce_complete_use_omnifunc == 1
		set omnifunc=visualforce#Complete
	else
		set completefunc=visualforce#Complete
	endif
endfunction

