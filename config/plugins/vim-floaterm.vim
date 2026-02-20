" vim-floaterm
if v:version >= 802 || has('nvim')
    let floaterm_wintype = 'popup'
    let floaterm_height  = 0.8
else
    let floaterm_wintype = 'split'
    let floaterm_height  = 0.36
endif
if v:progpath =~? 'exe'
    let g:floaterm_shell = &shell
else
    let g:floaterm_shell = 'bash --login'
endif
