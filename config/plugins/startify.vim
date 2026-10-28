" one cached `git status` call (5s TTL) feeds both lists; entries are
" capped, and huge repos (index over the skip threshold) skip the git
" call entirely to keep the start page fast
let g:startify_git_list_max   = 100
let g:startify_git_index_skip = 4194304

let s:git_status_time = 0
let s:git_status_out  = []

function! s:gitStatusOutput() abort
    if localtime() - s:git_status_time <= 5
        return s:git_status_out
    endif
    let s:git_status_time = localtime()

    let l:git = finddir('.git', escape(getcwd(), ' ,') . ';')
    if empty(l:git) || getfsize(l:git . '/index') > g:startify_git_index_skip
        let s:git_status_out = []
    else
        let s:git_status_out = systemlist('git -c core.quotePath=false status --porcelain 2>/dev/null')
    endif
    return s:git_status_out
endfunction

" strip the porcelain status code, e.g. '?? path' -> 'path'
function! s:toEntries(lines) abort
    let l:names = map(copy(a:lines), "substitute(matchstr(v:val, '...\\zs.*'), '.*-> ', '', '')")
    return map(l:names, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitModified()
    let l:changes = filter(copy(s:gitStatusOutput()), 'v:val !~# "^??"')
    return s:toEntries(l:changes[:g:startify_git_list_max - 1])
endfunction

" same, but untracked files only
function! s:gitUntracked()
    let l:untracked = filter(copy(s:gitStatusOutput()), 'v:val =~# "^??"')
    return s:toEntries(l:untracked[:g:startify_git_list_max - 1])
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   Git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   Git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
