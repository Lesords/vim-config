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
    call util#LeaderfSafe(printf("Leaderf! file --input %s ", l:file))
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

function! util#OpenFern()
  if empty(expand('%'))
    execute 'Fern . -drawer -toggle'
  else
    execute 'Fern . -drawer -toggle -reveal=%'
  endif
endfunction

" Run a :Leaderf command, swallowing the traceback printed when Ctrl-C
" interrupts LeaderF's python state machine (E684 on a wiped buffer etc.)
function! util#LeaderfSafe(cmd) abort
    try
        execute a:cmd
    catch
    endtry
endfunction

" Mirrors LeaderF gtagsExpl.py: GTAGS db lives under
" ~/.cache/LeaderF/gtags/<project root, '/' replaced by '_'>(git projects only)
function! util#LeaderfGtagsQuery(type) abort
    let l:dir = fnamemodify(expand('%'), ':p:h')
    let l:git = finddir('.git', escape(l:dir, ' ,') . ';')
    if !empty(l:git)
        " finddir returns a cwd-relative path; :p expands it, :h:h strips
        " the trailing slash and the '.git' component
        let l:root = fnamemodify(l:git, ':p:h:h')
        let l:db = expand('~/.cache/LeaderF/gtags/')
                    \ . substitute(l:root, '/', '_', 'g') . '/GTAGS'
        if filereadable(l:db)
            call util#LeaderfSafe(printf("Leaderf! gtags %s %s --auto-jump", a:type, expand("<cword>")))
            return
        endif
    endif
    echohl WarningMsg
    echom "No GTAGS db for this project, run <leader>fg to generate"
    echohl NONE
endfunction
