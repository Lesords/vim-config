noremap  <silent> h      <C-w>h
noremap  <silent> j      <C-w>j
noremap  <silent> k      <C-w>k
noremap  <silent> l      <C-w>l
tnoremap <silent> h      <C-w>h
tnoremap <silent> j      <C-w>j
tnoremap <silent> k      <C-w>k
tnoremap <silent> l      <C-w>l
tnoremap <silent> n      <C-w>N

noremap  <silent> gp       <C-^>
noremap  <silent> <C-q>    :q<CR>
noremap  <silent> q      :q<CR>
noremap  <silent> <C-s>    :w<CR>
noremap  <silent> s      :w<CR>
inoremap <silent> <C-s>    <esc>:w<CR>
inoremap <silent> s      <esc>:w<CR>
inoremap <silent> <C-j>    <esc>
vnoremap <silent> <C-j>    <esc>

nnoremap <silent> <BS>     gT
nnoremap <silent> T        :tabnew<CR>

" count number of matches of a pattern
nnoremap <silent> ,*       *<C-O>:%s///gn<CR>

nnoremap ,c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>



" vim-floaterm
nnoremap <silent> o      :FloatermToggle<CR>
tnoremap <silent> o      <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> ,lg      :FloatermNew --width=0.8 lazygit<cr>
nnoremap <silent> <F7>     :FloatermNew<CR>
tnoremap <silent> <F7>     <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F8>     :FloatermPrev<CR>
tnoremap <silent> <F8>     <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F9>     :FloatermNext<CR>
tnoremap <silent> <F9>     <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F12>    :FloatermToggle<CR>
tnoremap <silent> <F12>    <C-\><C-n>:FloatermToggle<CR>

" vim-easymotion
nnoremap s                 <Plug>(easymotion-overwin-f2)
nnoremap <leader>/         <Plug>(easymotion-sn)
onoremap /                 <Plug>(easymotion-tn)
nnoremap <Leader>j         <Plug>(easymotion-j)
nnoremap <Leader>k         <Plug>(easymotion-k)

" Tabularize
nnoremap <Leader>a=        :Tabularize /=<CR>
vnoremap <Leader>a=        :Tabularize /=<CR>
nnoremap <Leader>a:        :Tabularize /:\zs<CR>
vnoremap <Leader>a:        :Tabularize /:\zs<CR>

" Signify
nnoremap d               :SignifyToggle<cr>
inoremap d               :SignifyToggle<cr>
nnoremap <leader>gd        :SignifyDiff<cr>
nnoremap <leader>gp        :SignifyHunkDiff<cr>
nnoremap <leader>gu        :SignifyHunkUndo<cr>
nnoremap <leader>gj        <plug>(signify-next-hunk)
nnoremap <leader>gk        <plug>(signify-prev-hunk)
" hunk text object
onoremap ic                <plug>(signify-motion-inner-pending)
xnoremap ic                <plug>(signify-motion-inner-visual)
onoremap ac                <plug>(signify-motion-outer-pending)
xnoremap ac                <plug>(signify-motion-outer-visual)

noremap  <silent> m      :Fern . -drawer -toggle -reveal=%<cr>
inoremap <silent> m      <C-o>:Fern . -drawer -toggle -reveal=% -stay<cr>
noremap  <silent> p      :UndotreeToggle<cr>
noremap  <silent> n      :Vista!!<cr>
