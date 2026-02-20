if exists('$MSYSTEM') && $MSYSTEM == 'MINGW64'
    let &pythonthreedll=$HOME.'/AppData/Local/Programs/Python/Python38/python38.dll'
    " let &pythonthreedll='/c/Python312/python3.dll' " PE32+ executable (DLL) (GUI) x86-64, for MS Windows, 7 sections, not work for leaderf of gVim

    if v:progpath !~? 'exe'
        nnoremap <silent> ,o :exec 'call system("start \"" . expand("%") . "\"")' <bar> echo 'Opening current file...' <CR>
    else
        nnoremap <silent> ,o :exec 'call system("bash start \"" . substitute(expand("%:p"), "\\", "/", "g") . "\"")' <bar> echo 'Opening current file...' <CR>
    endif
    nnoremap <silent> ,e :exec 'call system("explorer .")' <bar> echo 'Opening current path...' <CR>
endif

" gvim
if has('gui_running')
    set guifont=Consolas:h12
    set guioptions=eg
    set linespace=0
endif

if v:progpath =~? 'exe'
    map ,p "+p<CR>
    vnoremap ,y "+y<CR>

    noremap <A-h> <C-w>h
    noremap <A-j> <C-w>j
    noremap <A-k> <C-w>k
    noremap <A-l> <C-w>l
    tnoremap <A-h> <C-w>h
    tnoremap <A-j> <C-w>j
    tnoremap <A-k> <C-w>k
    tnoremap <A-l> <C-w>l
    tnoremap <A-n> <C-w>N

    noremap <A-q> :q<CR>
    noremap <A-s> :w<CR>
    inoremap <A-s> <esc>:w<CR>

    " motion
    noremap <silent> <A-K> :call motion#Moveup_line()<CR>
    noremap <silent> <A-J> :call motion#Movedown_line()<CR>
    inoremap <silent> <A-K> <ESC>:call motion#Moveup_line()<CR>a
    inoremap <silent> <A-J> <ESC>:call motion#Movedown_line()<CR>a
    vnoremap <silent> <A-K> :call motion#Moveup_multlines()<CR>gv
    vnoremap <silent> <A-J> :call motion#Movedown_multlines()<CR>gv

    noremap <silent> <A-t> :call ChangeCurrentPath()<CR>
    noremap <silent> <A-i> :call ChangeLineStyle()<CR>

    " Plugin
    nnoremap <silent> <A-d> :SignifyToggle<cr>
    inoremap <silent> <A-d> :SignifyToggle<cr>
    noremap <A-f> :<C-U><C-R>=printf("Leaderf! rg --no-auto-preview -F -e %s ", expand("<cword>"))<CR>

    if !exists('$MSYSTEM')
        noremap  <silent> <A-n> :Vista!!<cr>
    endif
    noremap  <silent> <A-m> :Fern . -drawer -toggle -reveal=%<cr>
    inoremap <silent> <A-m> <C-o>:Fern . -drawer -toggle -reveal=% -stay<cr>
    noremap  <silent> <A-p> :UndotreeToggle<cr>
    nnoremap <silent> <A-o>  :FloatermToggle<CR>
    tnoremap <silent> <A-o>   <C-\><C-n>:FloatermToggle<CR>
endif
