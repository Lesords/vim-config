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
