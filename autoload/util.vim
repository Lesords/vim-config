function! util#ClearSpaceChar()
    %s/\s\+$//g
endfunction

function! util#HexModeToggle()
    if g:hexmode
        %!xxd -r
    else
        %!xxd
    endif
    let g:hexmode = !g:hexmode
endfunction

function! util#ChangeCurrentPath()
    execute 'cd' g:cwd
endfunction

function! util#PlainToggle()
    let &cole=(&cole == 2) ? 0 : 2

    call util#ChangeLineStyle()
endfunction

function! util#ChangeLineStyle()
    if g:linestyle == 'yes'
        let g:linestyle = 'no'
        set nonumber
        set norelativenumber
        set signcolumn=no
    else
        let g:linestyle = 'yes'
        set number
        set relativenumber
        set signcolumn=yes
    endif
endfunction

function! util#ChangeIndentation()
    let shiftwidth_value = &shiftwidth

    if ( shiftwidth_value == 4 )
        set tabstop=2
        set shiftwidth=2
        echo "switch to 2 space mode"
    else
        set tabstop=4
        set shiftwidth=4
        echo "switch to 4 space mode"
    endif
endfunction

function! util#ChangeTab()
    if &expandtab
        set noet|retab!
        echo "Change space to tab"
    else
        set et|retab
        echo "Change tab to space"
    endif
endfunction


function! s:GetSurroundText() abort
    let l:line = getline('.')
    let l:col  = col('.')

    let l:m = matchstrpos(
                \ l:line,
                \ '<\([^>]*\)\%'.l:col.'c[^>]*>',
                \ 0
                \ )
    if l:m[1] != -1
        return l:m[0][1:-2]
    endif

    let l:m = matchstrpos(
                \ l:line,
                \ '"\([^"]*\)\%'.l:col.'c[^"]*"',
                \ 0
                \ )
    if l:m[1] != -1
        return l:m[0][1:-2]
    endif

    return ''
endfunction

function! util#GetCurrentFile() abort
    let l:file = s:GetSurroundText()
    if (l:file == "")
        echo "error: no file need to search"
        return
    endif
    execute printf("Leaderf! file --input %s ", l:file)
endfunction

function! util#WindowToggle()
    if ( g:windowid != win_getid() )
        let g:windowtoggle = 'no'
    endif

    if ( g:windowtoggle == 'no' )
        let g:windowid = win_getid()
        let g:windowtoggle = 'yes'
        let fullHeight = &lines - 2
        let fullWidth = &columns

        execute 'resize' fullHeight
        execute 'vertical resize' fullWidth
    else
        let g:windowtoggle = 'no'
        wincmd =
    endif
endfunction
