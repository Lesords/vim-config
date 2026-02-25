let mapleader    = ","
let g:cocEnabled = 'no'
let g:vim_lsp_enabled = 'yes'
if ( g:vim_lsp_enabled == 'no' && system('which clangd') != "" && system('which node') != "" )
    let g:cocEnabled = 'yes'
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/vim-indent-guides'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-signify', { 'on': ['SignifyToggle', 'SignifyDiff', 'SignifyHunkDiff', 'SignifyHunkUndo'] }
Plug 'tpope/vim-surround'
Plug 'wellle/context.vim'
Plug 'jiangmiao/auto-pairs'
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
endif

if has('vim9script') && v:version >= 901
    Plug 'girishji/scope.vim'
    Plug 'vim-fuzzbox/fuzzbox.vim'
endif

if has('nvim')
    Plug 'nvim-lua/plenary.nvim',                       { 'dir': '~/.config/nvim/plugged/plenary.nvim' }
    Plug 'CopilotC-Nvim/CopilotChat.nvim',              { 'dir': '~/.config/nvim/plugged/CopilotChat.nvim' }
    Plug 'olimorris/codecompanion.nvim',                { 'dir': '~/.config/nvim/plugged/codecompanion.nvim' }
    Plug 'ravitemer/codecompanion-history.nvim',        { 'dir': '~/.config/nvim/plugged/codecompanion-history.nvim' }
    Plug 'franco-ruggeri/codecompanion-spinner.nvim',   { 'dir': '~/.config/nvim/plugged/codecompanion-spinner.nvim' }

    Plug 'saghen/blink.cmp',                            { 'tag': 'v1.*' }
    Plug 'fang2hou/blink-copilot',                      { 'dir': '~/.config/nvim/plugged/blink-copilot' }
    Plug 'pxwg/blink-cmp-copilot-chat',                 { 'dir': '~/.config/nvim/plugged/blink-cmp-copilot-chat' }
    Plug 'zbirenbaum/copilot.lua',                      { 'dir': '~/.config/nvim/plugged/copilot.lua' }

    Plug 'kevinhwang91/nvim-ufo',                       { 'dir': '~/.config/nvim/plugged/nvim-ufo' }
    Plug 'kevinhwang91/promise-async',                  { 'dir': '~/.config/nvim/plugged/promise-async' }
    Plug 'lukas-reineke/indent-blankline.nvim',         { 'dir': '~/.config/nvim/plugged/indent-blankline.nvim' }

    Plug 'nvim-treesitter/nvim-treesitter',             { 'branch': 'master', 'do': ':TSUpdate' }
    Plug 'MeanderingProgrammer/render-markdown.nvim',   { 'dir': '~/.config/nvim/plugged/render-markdown.nvim' }
    " Used by render-markdown.nvim
    Plug 'nvim-mini/mini.nvim',                         { 'dir': '~/.config/nvim/plugged/mini.nvim' }

    Plug 'folke/noice.nvim',                            { 'dir': '~/.config/nvim/plugged/noice.nvim' }
    Plug 'rcarriga/nvim-notify',                        { 'dir': '~/.config/nvim/plugged/nvim-notify' }
    Plug 'MunifTanjim/nui.nvim',                        { 'dir': '~/.config/nvim/plugged/nui.nvim' }
    Plug 'nvim-telescope/telescope.nvim',               { 'dir': '~/.config/nvim/plugged/telescope.nvim' }

    Plug 'yetone/avante.nvim',                          { 'branch': 'main', 'do': 'make' }
endif
call plug#end()

source ~/.vim/config/lang.vim
source ~/.vim/config/motion.vim
source ~/.vim/config/ui.vim
source ~/.vim/config/util.vim
source ~/.vim/config/plugins/coc.vim
source ~/.vim/config/plugins/fern.vim
source ~/.vim/config/plugins/leaderf.vim
source ~/.vim/config/plugins/lightline.vim
source ~/.vim/config/plugins/startify.vim
source ~/.vim/config/plugins/vim-floaterm.vim
source ~/.vim/config/plugins/vim-lsp.vim
