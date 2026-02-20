command -nargs=1 Count :%s/<args>//gn

command! Reload source $MYVIMRC

command! Plain call util#PlainToggle()

command! Strip call util#ClearSpaceChar()

let g:hexmode = 0
command! Hexmode call util#HexModeToggle()

let g:cwd = getcwd(-1)
noremap <silent> t :call util#ChangeCurrentPath()<CR>

let g:linestyle = 'yes'
noremap <silent> i :call util#ChangeLineStyle()<CR>

noremap <silent> ,i :call util#ChangeIndentation()<CR>

noremap <silent> ,t :call util#ChangeTab()<CR>

let g:windowid = ''
let g:windowtoggle = 'no'
noremap <silent> ,m :call util#WindowToggle()<CR>

noremap <silent> ,gh :call util#GetCurrentFile()<CR>
