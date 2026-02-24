noremap  <silent> h      <C-w>h
noremap  <silent> j      <C-w>j
noremap  <silent> k      <C-w>k
noremap  <silent> l      <C-w>l
vnoremap <silent> h      <C-w>h
vnoremap <silent> j      <C-w>j
vnoremap <silent> k      <C-w>k
vnoremap <silent> l      <C-w>l
tnoremap <silent> h      <C-w>h
tnoremap <silent> j      <C-w>j
tnoremap <silent> k      <C-w>k
tnoremap <silent> l      <C-w>l
tnoremap <silent> n      <C-w>N

inoremap <silent> <C-a>    <Esc>^i
inoremap <silent> <C-e>    <Esc>$a
inoremap <silent> b      <Esc>bi
inoremap <silent> f      <Esc>ea

noremap  <silent> gp       <C-^>
noremap  <silent> <C-q>    :q<CR>
noremap  <silent> q      :q<CR>
noremap  <silent> <C-s>    :w<CR>
noremap  <silent> s      :w<CR>
inoremap <silent> <C-s>    <esc>:w<CR>
inoremap <silent> s      <esc>:w<CR>
inoremap <silent> <C-j>    <esc>
vnoremap <silent> <C-j>    <esc>

nnoremap <silent> <BS>     gt
nnoremap <silent> <BS>   gT
nnoremap <silent> T        :tabnew<CR>

cnoremap <C-A>             <Home>
cnoremap <C-E>             <End>
cnoremap b               <S-Left>
cnoremap f               <S-Right>

" count number of matches of a pattern
nnoremap <silent> ,*       *<C-O>:%s///gn<CR>

nnoremap ,c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

if executable('dolphin')
    nnoremap <silent> ,e :exec 'call system("dolphin . &")' <bar> echo 'Opening current path...' <CR>
    nnoremap <silent> ,o :exec 'call system("dolphin --select " . expand("%:p") . " &")' <bar> echo 'Opening current file...' <CR>
endif

if has('clipboard')
    vnoremap <RightMouse> "+y
endif

noremap <silent> <C-RightMouse> <C-o>

" motion
noremap <silent> K :call motion#Moveup_line()<CR>
noremap <silent> J :call motion#Movedown_line()<CR>
inoremap <silent> K <ESC>:call motion#Moveup_line()<CR>a
inoremap <silent> J <ESC>:call motion#Movedown_line()<CR>a
vnoremap <silent> K :call motion#Moveup_multlines()<CR>gv
vnoremap <silent> J :call motion#Movedown_multlines()<CR>gv



" vim-floaterm
nnoremap <silent> o      :FloatermToggle<CR>
tnoremap <silent> o      <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> ,lg      :FloatermNew --width=0.8 lazygit<cr>
tnoremap <silent> ,f+      <cmd>FloatermUpdate --height=0.95 --width=0.99<cr>
tnoremap <silent> ,f-      <cmd>FloatermUpdate --height=g:floaterm_height --width=g:floaterm_width<cr>
nnoremap <silent> <F7>     :FloatermNew<CR>
tnoremap <silent> <F7>     <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F8>     :FloatermPrev<CR>
tnoremap <silent> <F8>     <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F9>     :FloatermNext<CR>
tnoremap <silent> <F9>     <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F10>    :FloatermNew --height=0.3 --wintype=split<CR>
tnoremap <silent> <F10>    <C-\><C-n>:FloatermNew --height=0.3 --wintype=split<CR>

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

" obsession
nnoremap <leader>s         :Obsession<cr>

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

" context
nnoremap <leader>[         :ContextToggleWindow<cr>

" vim-clang-format
autocmd FileType c,cpp,objc noremap <silent> <leader>cf  :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <silent> <leader>cf :ClangFormat<CR>

" Leaderf
if has('python') || has('python3')
    noremap <leader>ff  :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
    noremap <leader>fb  :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
    noremap <leader>fm  :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
    noremap <leader>fw  :<C-U><C-R>=printf("Leaderf window %s", "")<CR><CR>
    noremap <leader>fl  :<C-U><C-R>=printf("Leaderf line --no-auto-preview %s", "")<CR><CR>

    noremap <leader>fa  :<C-U><C-R>=printf("Leaderf! rg --all-buffers -F -e %s ", expand("<cword>"))<CR>
    noremap <leader>fc  :<C-U><C-R>=printf("Leaderf! rg -F -e %s -g *.{h,c,cpp}", expand("<cword>"))<CR>
    noremap <leader>fs  :<C-U><C-R>=printf("Leaderf! rg --stayOpen --no-auto-preview --left -F -e \"%s\"", input("Please enter: "))<CR>
    noremap f         :<C-U><C-R>=printf("Leaderf! rg --no-auto-preview -F -e %s ", expand("<cword>"))<CR>
    xnoremap gf         :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
    xnoremap gp         :<C-U><C-R>=printf("Leaderf! file --input %s ", leaderf#Rg#visual())<CR><CR>
    noremap go          :<C-U>Leaderf! rg --recall<CR>

    noremap <silent> <leader>fg :Leaderf gtags --update<CR>
    noremap <silent> <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <silent> <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <silent> <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
    noremap <silent> <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
    noremap <silent> <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

    noremap <silent> <C-LeftMouse> :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
endif

nnoremap <silent> m      :call util#OpenFern()<CR>
inoremap <silent> m      <C-o>:call util#OpenFern()<cr>
noremap  <silent> p      :UndotreeToggle<cr>
noremap  <silent> n      :Vista!!<cr>

" asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

if has('vim9script') && v:version >= 901
    nnoremap <Space>ff <scriptcmd>vim9cmd scope#fuzzy#File()<cr>
    nnoremap <Space>fs <scriptcmd>vim9cmd scope#fuzzy#Grep('rg --vimgrep --smart-case')<cr>
    nnoremap <Space>fz :FuzzyFiles<CR>
    nnoremap <Space>fl :FuzzyInBuffer<CR>
endif

if has('vim9script') && v:version >= 900
  nnoremap <Space>cc :CopilotChatOpen<CR>
endif
