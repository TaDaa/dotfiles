function! ParseWiki()
let l:start = 0
let l:end = line('$')
let l:index = l:start
normal! gg
while search("^[^\'][a-zA-Z\ \-]*") 
    let l:line = getline('.')
    let l:index = 0
    while len(getline('.')) > 0 && getline('.')[0] != "'"
        let l:index = l:index + 1
        normal! x
    endwhile
    if getline('.') == ""
        normal! dd
    endif
endwhile
normal! gg
let l:last_line = line('.')
let l:last_column=col('.')
while search("[^\,|\'][a-zA-Z\ :\-]*[^\']") && (l:last_line < line('.') || (l:last_line == line('.') &&  l:last_column < col('.')))
    let l:last_line = line('.')
    let l:last_column = col('.')
    normal cs'"
    normal! f"
    normal! a:{}
    call feedkeys("\<esc>")
    normal f}
    if getline('.')[col('.')+1] == ''
        normal! a,
        call feedkeys("\<esc>\<down>^")
    else
        if getline('.')[col('.')] != ',' 
            normal! a,
        endif
        call feedkeys("\<esc>f,a\<right>\<cr>")
    endif
    call feedkeys("\<esc>")
endwhile
call feedkeys("$x","t")
endfunction
let g:ParseWiki = ParseWiki
