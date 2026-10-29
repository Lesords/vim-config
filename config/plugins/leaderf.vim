" LeaderF
if has('python') || has('python3')
    if exists('$MSYSTEM') && $MSYSTEM == 'MINGW64'
        let g:Lf_CacheDirectory = $APPDATA
    endif
    let g:Lf_UseCache = 0
    let g:Lf_UseVersionControlTool = 0
    let g:Lf_IgnoreCurrentBufferName = 1
    let g:Lf_PopupWidth     = 0.45
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_JumpToExistingWindow = 0
    " prompt keys: C-n/C-p results, C-j/C-k preview, C-a/C-e input ends,
    " C-q quit, Ctrl-BS clears input, C-u/C-d page results symmetrically
    let g:Lf_CommandMap = {
        \ '<C-J>':    ['<C-N>'],
        \ '<C-K>':    ['<C-P>'],
        \ '<C-Down>': ['<C-J>', '<C-Down>'],
        \ '<C-Up>':   ['<C-K>', '<C-Up>'],
        \ '<Home>':   ['<Home>', '<C-A>'],
        \ '<End>':    ['<End>', '<C-E>'],
        \ '<C-C>':    ['<C-C>', '<C-Q>'],
        \ '<C-U>':    ['<C-H>'],
        \ '<PageUp>':   ['<PageUp>', '<C-U>'],
        \ '<PageDown>': ['<PageDown>', '<C-D>'],
        \ }
    " let g:Lf_Gtagsconf="$HOME/.local/share/gtags/gtags.conf"
endif
