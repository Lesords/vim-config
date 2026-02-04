let mapleader    = ","
let g:cocEnabled = 'no'
let g:vim_lsp_enabled = 'yes'
if ( g:vim_lsp_enabled == 'no' && system('which clangd') != "" && system('which node') != "" )
    let g:cocEnabled = 'yes'
endif

" vim-cpp-modern
" Disable function highlighting
let g:cpp_function_highlight   = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables
let g:cpp_member_highlight     = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
let g:cpp_simple_highlight     = 1

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/vim-indent-guides'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-signify', { 'on': ['SignifyToggle', 'SignifyDiff', 'SignifyHunkDiff', 'SignifyHunkUndo'] }
Plug 'tpope/vim-surround'
Plug 'wellle/context.vim'
if !has('nvim') 
    Plug 'jiangmiao/auto-pairs'
endif
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi'
Plug 'terryma/vim-expand-region'
Plug 'easymotion/vim-easymotion', { 'on': ['<Plug>(easymotion-overwin-f2)', '<Plug>(easymotion-sn)', '<Plug>(easymotion-tn)', '<Plug>(easymotion-j)', '<Plug>(easymotion-k)'] }
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'

Plug 'lambdalisue/fern.vim', { 'on': 'Fern' }
Plug 'lambdalisue/fern-renderer-nerdfont.vim', { 'on': 'Fern' }
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'voldikss/vim-floaterm', { 'on': ['FloatermToggle', 'FloatermNew', 'FloatermPrev', 'FloatermNext', 'FloatermUpdate'] }

" Plug 'dense-analysis/ale' " slow bug

if !exists('$MSYSTEM')
    Plug 'mhinz/vim-startify'
    Plug 'liuchengxu/vista.vim', { 'on': 'Vista!!' }
    Plug 'christoomey/vim-tmux-navigator'
endif

if has('python') || has('python3')
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension', 'on': ['Leaderf', 'LeaderfFile', 'LeaderfBuffer', 'LeaderfMru'] }
endif

if ( g:cocEnabled == 'yes' )
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

if ( g:vim_lsp_enabled == 'yes' )
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
endif

if has('vim9script') && v:version >= 900
    Plug 'github/copilot.vim'
    Plug 'DanBradbury/copilot-chat.vim'
endif

if has('vim9script') && v:version >= 901
    Plug 'girishji/scope.vim'
    Plug 'vim-fuzzbox/fuzzbox.vim'
endif

if has('nvim')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'CopilotC-Nvim/CopilotChat.nvim'

    Plug 'saghen/blink.cmp', { 'tag': 'v1.*' }
    Plug 'fang2hou/blink-copilot'
    Plug 'pxwg/blink-cmp-copilot-chat'
    Plug 'github/copilot.vim'

    Plug 'kevinhwang91/nvim-ufo'
    Plug 'kevinhwang91/promise-async'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'MeanderingProgrammer/render-markdown.nvim'
    " Used by render-markdown.nvim
    Plug 'nvim-mini/mini.nvim'

    Plug 'folke/noice.nvim'
    Plug 'rcarriga/nvim-notify'
    Plug 'MunifTanjim/nui.nvim'
endif
call plug#end()

" gruvbox
set background=dark
set signcolumn=yes
let g:gruvbox_contrast_dark    = 'medium'
let g:gruvbox_sign_column      = 'bg0'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

" indentLine
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'man', 'fern', 'startify', 'copilot-chat']

" rainbow
let g:rainbow_active = 1

" lightline
set laststatus=2
set showtabline=2

function! GetObsessionStatus() abort
    let status = ObsessionStatus()
    return status == '' ? '[N]' : status
endfunction

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let relativepath = expand('%:F') !=# '' ? expand('%:F') : '[No Name]'
    return winwidth(0) > 70 ? relativepath : filename
endfunction

let g:filenameAndMethod = '%{GetObsessionStatus()} %{LightlineFilename()}'.
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

" startify
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
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

" vista in lightline
if exists('g:loaded_vista')
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
endif
function! NearestMethodOrFunction() abort
    let method = get(b:, 'vista_nearest_method_or_function', '')
    return method != '' ? '   '.method : method
endfunction

" vim-tmux-navigator
let g:tmux_navigator_no_wrap = 1

" vim-commentary
autocmd FileType apache              setlocal commentstring=#\ %s
autocmd FileType python,shell,coffee setlocal commentstring=#\ %s
autocmd FileType java,c,cpp          setlocal commentstring=//\ %s

" vim-visual-multi
let g:VM_maps = {}
let g:VM_maps['Exit'] = '<C-j>'

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

" fern
if !has('nvim') && !has('patch-8.2.5136')
    let g:fern_disable_startup_warnings = 1
endif

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

" Signify
set updatetime=1000
let g:signify_disable_by_default = 1 " for WSL2

" auto pairs
let g:AutoPairsShortcutToggle     = ',ap'
let g:AutoPairsShortcutFastWrap   = ',ae'
let g:AutoPairsShortcutJump       = ',an'
let g:AutoPairsShortcutBackInsert = ',ab'

" vim-easymotion
let g:EasyMotion_do_mapping = 0

" ale
let b:ale_linters           = {'c': ['gcc', 'cppcheck'], 'cpp': ['gcc', 'cppcheck'] }
let g:ale_echo_msg_format   = '[%linter%] %s [%severity%]'

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

" vim-lsp
if ( g:vim_lsp_enabled == 'yes' )
    let g:lsp_inlay_hints_enabled = 1
    let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

    function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> gt <plug>(lsp-type-definition)
        nmap <buffer> gi <plug>(lsp-implementation)
        nmap <buffer> gr <plug>(lsp-references)
        nmap <buffer> gs <plug>(lsp-document-symbol-search)
        nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
        nmap <buffer> <leader>rn <plug>(lsp-rename)
        nmap <buffer> [g <plug>(lsp-previous-diagnostic)
        nmap <buffer> ]g <plug>(lsp-next-diagnostic)
        nmap <buffer> K <plug>(lsp-hover)

        function! s:smart_scroll_expr(count, fallback) abort
            let l:winid = lsp#document_hover_preview_winid()
            if l:winid != v:null && l:winid != 0
                " LSP hover window exists, use lsp#scroll()
                return lsp#scroll(a:count)
            else
                " No LSP hover, use normal scroll
                return a:fallback
            endif
        endfunction

        nnoremap <buffer> <expr> <c-d> <SID>smart_scroll_expr(+4, "\<c-d>")
        nnoremap <buffer> <expr> <c-u> <SID>smart_scroll_expr(-4, "\<c-u>")
    endfunction

    augroup lsp_install
        au!
        " call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END

    augroup LspInlayHintsColors
        autocmd!
        " Scheme 1: comment style
        autocmd ColorScheme * highlight lspInlayHintsType ctermfg=243 guifg=#7c6f64
        autocmd ColorScheme * highlight lspInlayHintsParameter ctermfg=243 guifg=#7c6f64

        " Scheme 2: blue text
        " autocmd ColorScheme * highlight lspInlayHintsType ctermfg=109 guifg=#83a598 ctermbg=235 guibg=#282828
        " autocmd ColorScheme * highlight lspInlayHintsParameter ctermfg=109 guifg=#83a598 ctermbg=235 guibg=#282828

        " Scheme 3: orange/yellow (If the terminal does not support italics, it will be displayed in reverse)
        " autocmd ColorScheme * highlight lspInlayHintsType ctermfg=208 guifg=#fe8019 gui=italic cterm=italic
        " autocmd ColorScheme * highlight lspInlayHintsParameter ctermfg=172 guifg=#d79921 gui=italic cterm=italic
    augroup END
endif
