" vim-cpp-modern
" Disable function highlighting
let g:cpp_function_highlight   = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables
let g:cpp_member_highlight     = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
let g:cpp_simple_highlight     = 1

" vim-commentary
autocmd FileType apache              setlocal commentstring=#\ %s
autocmd FileType python,shell,coffee setlocal commentstring=#\ %s
autocmd FileType java,c,cpp          setlocal commentstring=//\ %s

" ale
let b:ale_linters           = {'c': ['gcc', 'cppcheck'], 'cpp': ['gcc', 'cppcheck'] }
let g:ale_echo_msg_format   = '[%linter%] %s [%severity%]'
