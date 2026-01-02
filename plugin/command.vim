command -nargs=1 Count :%s/<args>//gn

command! Reload source $MYVIMRC

command! Plain call PlainToggle()
function! PlainToggle()
    let &cole=(&cole == 2) ? 0 : 2

    call ChangeLineStyle()
endfunction

command! Strip call ClearSpaceChar()
function! ClearSpaceChar()
    %s/\s\+$//g
endfunction

command! Hexmode call HexModeToggle()
let g:hexmode = 0
function! HexModeToggle()
    if g:hexmode
        %!xxd -r
    else
        %!xxd
    endif
    let g:hexmode = !g:hexmode
endfunction

let g:cwd = getcwd(-1)
noremap <silent> t :call ChangeCurrentPath()<CR>
function! ChangeCurrentPath()
    execute 'cd' g:cwd
endfunction

noremap <silent> i :call ChangeLineStyle()<CR>
let g:linestyle = 'yes'
function! ChangeLineStyle()
    if g:linestyle == 'yes'
        let g:linestyle = 'no'
        set nonumber
        set signcolumn=no
    else
        let g:linestyle = 'yes'
        set number
        set signcolumn=yes
    endif
endfunction

noremap <silent> ,i :call ChangeIndentation()<CR>
function! ChangeIndentation()
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

noremap <silent> ,t :call ChangeTab()<CR>
function! ChangeTab()
    if &expandtab
        set noet|retab!
        echo "Change space to tab"
    else
        set et|retab
        echo "Change tab to space"
    endif
endfunction

noremap <silent> ,m :call WindowToggle()<CR>
let g:windowid = ''
let g:windowtoggle = 'no'
function! WindowToggle()
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

function! GetSurroundText() abort
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

noremap <silent> ,gh :call GetCurrentFile()<CR>
function! GetCurrentFile() abort
    let l:file = GetSurroundText()
    if (l:file == "")
        echo "error: no file need to search"
        return
    endif
    execute printf("Leaderf! file --input %s ", l:file)
endfunction
