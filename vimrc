set nocompatible    " 关闭 vi 兼容模式
set mouse=a         " 启动鼠标模式
set ttymouse=sgr
set shiftwidth=4    " 设置缩进的空格数位4
set tabstop=4       " 设置 Tab 键宽度为 4 个空格
set expandtab       " 将 tab 转换为空格
set smartindent     " 智能选择对齐方式
set cindent         " 设置使用 C/C++ 语言的自动缩进方式
set autoindent      " 设置自动缩进
set autoread        " 文件变化时自动重读
set number          " 显示行号
set ruler           " 显示光标位置
set showmatch       " 高亮显示匹配的括号
set showcmd         " 右下角显示命令
set smartcase       " 搜索时智能匹配大小写
set wildmenu        " 使用 Tab 键补全时，在状态栏显示匹配的列表
set hlsearch        " 高亮匹配结果
set cursorline      " 突出显示当前行
set confirm         " 在处理 未保存 和 只读文件 的时候，弹出确认
set noerrorbells    " 关闭错误提示音

syntax enable       " 设置语法高亮度
syntax on
filetype on         " 开始文件类型侦测
filetype plugin on  " 加载对应文件类型插件
filetype indent on  " 自适应不同语言的智能缩进

if exists('$MSYSTEM') && $MSYSTEM == 'MINGW64'
    if exists('$PC') && $PC == 'PC'
        let &pythonthreedll=$HOME.'/AppData/Local/Programs/Python/Python38/python38.dll'
    elseif exists('$PC') && $PC == 'WORK'
        let &pythonthreedll='/c/Python312/python312.dll' " PE32+ executable (DLL) (GUI) x86-64, for MS Windows, 7 sections
    endif
endif

if v:version < 802
    set fillchars=vert:\⎜,fold:-
else
    set fillchars=eob:\ ,vert:\⎜,fold:-
endif

set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936    " 自动识别编码格式, 逗号分割不加空格
set tags=./tags;,./TAGS,tags,TAGS



let mapleader=","

noremap h <C-w>h
noremap j <C-w>j
noremap k <C-w>k
noremap l <C-w>l
tnoremap h <C-w>h
tnoremap j <C-w>j
tnoremap k <C-w>k
tnoremap l <C-w>l
tnoremap n <C-w>N

noremap gp  <C-^>
noremap <C-q> :q<CR>
noremap <C-s> :w<CR>
inoremap <C-s> <esc>:w<CR>
noremap q :q<CR>
noremap s :w<CR>
inoremap s <esc>:w<CR>
inoremap <C-j> <esc>
vnoremap <C-j> <esc>

nnoremap <Tab> gt
nnoremap <BS> gT
nnoremap <silent> T :tabnew<CR>

" count number of matches of a pattern
map ,* *<C-O>:%s///gn<CR>
command -nargs=1 Count :%s/<args>//gn

nnoremap <Leader>c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

let g:cwd = getcwd(-1)
noremap <silent> t :call ChangeCurrentPath()<CR>
function! ChangeCurrentPath()
    execute 'cd' g:cwd
endfunction

noremap <silent> i :call ChangeLineStyle()<CR>
let g:linestyle = 'yes'
function! ChangeLineStyle()
    if g:linestyle == 'yes'
        let g:linestyle = 'no'
        set nonumber
        set signcolumn=no
    else
        let g:linestyle = 'yes'
        set number
        set signcolumn=yes
    endif
endfunction

noremap <silent> ,i :call ChangeIndentation()<CR>
function! ChangeIndentation()
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

noremap <silent> ,t :call ChangeTab()<CR>
function! ChangeTab()
    if &expandtab
        set noet|retab!
        echo "Change space to tab"
    else
        set et|retab
        echo "Change tab to space"
    endif
endfunction

let g:cocEnabled = 'no'
if ( system('which clangd') != "" && system('which node') != "" )
    let g:cocEnabled = 'yes'
endif


call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'frazrepo/vim-rainbow' " so slow

" Plug 'dense-analysis/ale' " slow bug

if ( v:version >= 802 && has( 'patch3995') )
    if ( g:cocEnabled == 'no' )
        Plug 'ycm-core/YouCompleteMe'
    endif
endif

if ( g:cocEnabled == 'yes' )
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'rhysd/vim-clang-format'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

Plug 'mbbill/undotree'
Plug 'liuchengxu/vista.vim'

Plug 'voldikss/vim-floaterm'
call plug#end()

" lightline
set laststatus=2
set showtabline=2
if !has('gui_running')
    set t_Co=256
endif

let g:filenameAndMethod = '%{LightlineFilename()}'.
            \ '%#LightlineLeft_active_0_1#%{NearestMethodOrFunction()}'.
            \ '%#LightlineLeft_active_1#'
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filenameAndMethod', 'modified'] ],
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \   'filenameAndMethod': filenameAndMethod,
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'method': 'NearestMethodOrFunction',
      \ },
      \ }

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let relativepath = expand('%:F') !=# '' ? expand('%:F') : '[No Name]'
    return winwidth(0) > 70 ? relativepath : filename
endfunction

" vista in lightline
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
function! NearestMethodOrFunction() abort
    let method = get(b:, 'vista_nearest_method_or_function', '')
    return method != '' ? '   '.method : method
endfunction

" gruvbox
set background=dark
set signcolumn=yes
let g:gruvbox_contrast_dark    = 'medium'
let g:gruvbox_sign_column      = 'bg0'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

" rainbow
let g:rainbow_active          = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs   = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" indentLine
let g:indentLine_color_term   = 239
let g:indentLine_char_list    = ['|', '¦', '┆', '┊']
let g:vim_json_conceal        = 0
let g:markdown_syntax_conceal = 0

" vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s

" vim-floaterm
if v:version >= 802
    let floaterm_wintype = 'popup'
    let floaterm_height = 0.8
else
    let floaterm_wintype = 'split'
    let floaterm_height = 0.36
endif
let g:floaterm_shell = 'bash --login'

nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

" Signify
set updatetime=1000
let g:signify_disable_by_default = 1 " for WSL2
nnoremap <silent> d :SignifyToggle<cr>
inoremap <silent> d :SignifyToggle<cr>
nnoremap <silent> <leader>gd :SignifyDiff<cr>
nnoremap <silent> <leader>gp :SignifyHunkDiff<cr>
nnoremap <silent> <leader>gu :SignifyHunkUndo<cr>
nmap     <leader>gj <plug>(signify-next-hunk)
nmap     <leader>gk <plug>(signify-prev-hunk)
" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" vim-cpp-modern
" Disable function highlighting
let g:cpp_function_highlight   = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables
let g:cpp_member_highlight     = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
let g:cpp_simple_highlight     = 1

" LeaderF
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupWidth = 0.45
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader>fa :<C-U><C-R>=printf("Leaderf! rg --all-buffers -F -e %s ", expand("<cword>"))<CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf! rg -F -e %s -g *.{h,c,cpp}", expand("<cword>"))<CR>
noremap <leader>fs :<C-U><C-R>=printf("Leaderf! rg --stayOpen --no-auto-preview --left -F -e \"%s\"", input("Please enter: "))<CR>
noremap f :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", expand("<cword>"))<CR>
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

noremap <silent> <leader>fg :Leaderf gtags --update<CR>
noremap <silent> <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <silent> <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <silent> <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <silent> <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <silent> <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" let g:Lf_Gtagsconf="$HOME/.local/share/gtags/gtags.conf"

" fern
let g:fern#hide_cursor                       = 1
let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷  '
let g:fern#renderer#default#expanded_symbol  = '▼  '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '
let g:fern#renderer                          = "nerdfont"

function! s:init_fern() abort
    nmap <buffer><expr>
                \ <Plug>(fern-my-expand-or-collapse)
                \ fern#smart#leaf(
                \   "\<Plug>(fern-action-collapse)",
                \   "\<Plug>(fern-action-expand)",
                \   "\<Plug>(fern-action-collapse)",
                \ )

    nmap <buffer> <nowait> o <Plug>(fern-my-expand-or-collapse)
    nmap <buffer> t <Plug>(fern-action-open:tabedit)
    nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
    nmap <buffer> i <Plug>(fern-action-open:split)
    nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
    nmap <buffer> s <Plug>(fern-action-open:vsplit)
    nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p

    nmap <buffer> <nowait> < <Plug>(fern-action-leave)
    nmap <buffer> <nowait> > <Plug>(fern-action-enter)
    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
    nmap <buffer> cd <Plug>(fern-action-cd)
    nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>

    nmap <buffer> <LeftRelease> <Plug>(fern-action-open-or-expand)
endfunction

augroup fern-custom
    autocmd! *
    autocmd FileType fern setlocal norelativenumber nonumber |
                \ call s:init_fern()
augroup END

" glyph-palette (for fern)
augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" vim-multiple-cursors
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<C-j>'

" vim-easymotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)

map  <leader>/ <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ale
let b:ale_linters = {'c': ['gcc', 'cppcheck'], 'cpp': ['gcc', 'cppcheck'] }
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" YouCompleteMe
let g:ycm_use_clangd                                    = 0
" let g:ycm_show_diagnostics_ui                           = 0
let g:ycm_min_num_identifier_candidate_chars            = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings                           = 1
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{3}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_key_invoke_completion = '<C-h>'
set completeopt=menu,menuone

" shortcuts
nnoremap <leader>lg :FloatermNew --width=0.8 lazygit<cr>

noremap  <silent> m :Fern . -drawer -toggle -reveal=%<cr>
inoremap <silent> m <C-o>:Fern . -drawer -toggle -reveal=% -stay<cr>
noremap  <silent> p :UndotreeToggle<cr>
noremap  <silent> n :Vista!!<cr>
nnoremap <silent> o  :FloatermToggle<CR>
tnoremap <silent> o   <C-\><C-n>:FloatermToggle<CR>

" coc.nvim
if ( g:cocEnabled == "yes" )
    let g:coc_disable_startup_warning = 1

    " use <tab> to trigger completion and navigate to the next complete item
    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <silent><expr> <Tab>
                \ coc#pum#visible() ? coc#pum#next(1) :
                \ CheckBackspace() ? "\<Tab>" :
                \ coc#refresh()

    " Mappings for CoCList
    " Show all diagnostics
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nmap <space>cl  <Plug>(coc-codelens-action)
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K', 'in')
        endif
    endfunction
endif

" vim-clang-format
autocmd FileType c,cpp,objc noremap <silent> <C-k> :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <silent> <C-k> :ClangFormat<CR>
