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
    " let g:Lf_Gtagsconf="$HOME/.local/share/gtags/gtags.conf"
endif
