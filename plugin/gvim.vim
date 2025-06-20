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
