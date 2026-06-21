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

function! s:fern_yank(kind) abort
    let node = fern#helper#new().sync.get_cursor_node()
    if empty(node) | return | endif
    let value = a:kind ==# 'name'
                \ ? fnamemodify(node._path, ':t')
                \ : a:kind ==# 'relative'
                \   ? fnamemodify(node._path, ':~:.')
                \   : fnamemodify(node._path, ':h')
    call setreg(v:register, value)
    redraw | echo printf("Yanked %s: %s", a:kind, value)
endfunction

function! s:init_fern() abort
    nmap <buffer> t <Plug>(fern-action-open:tabedit)
    nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
    nmap <buffer> o <Plug>(fern-action-open:split)
    nmap <buffer> go <Plug>(fern-action-open:split)<C-w>p
    nmap <buffer> s <Plug>(fern-action-open:vsplit)
    nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p

    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
    nmap <buffer> cd <Plug>(fern-action-cd)
    nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>

    nmap <buffer> <LeftRelease> <Plug>(fern-action-open-or-expand)

    nmap <buffer> y <Plug>(fern-action-yank:path)
    nmap <buffer> yn :<C-u>call <SID>fern_yank('name')<CR>
    nmap <buffer> yr :<C-u>call <SID>fern_yank('relative')<CR>
    nmap <buffer> yd :<C-u>call <SID>fern_yank('dirname')<CR>
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
