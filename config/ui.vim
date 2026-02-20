" gruvbox
set background=dark
set signcolumn=yes
let g:gruvbox_contrast_dark    = 'medium'
let g:gruvbox_sign_column      = 'bg0'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

" indentLine
let g:indent_guides_enable_on_vim_startup = has('nvim') ? 0 : 1
let g:indent_guides_exclude_filetypes = ['help', 'man', 'fern', 'startify', 'copilot-chat', 'codecompanion']
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#282828 ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  guibg=#383838 ctermbg=236

" rainbow
let g:rainbow_active = 1
