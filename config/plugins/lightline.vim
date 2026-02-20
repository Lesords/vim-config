" lightline
set laststatus=2
set showtabline=2

function! CodeCompanionGetModel()
lua << EOF
    local cc = require("codecompanion")
    local chat = cc.buf_get_chat(vim.api.nvim_get_current_buf()) or cc.last_chat()
    local model_name = "Unknown"

    if chat and chat.adapter then
        if chat.adapter.model and chat.adapter.model.name then
            model_name = chat.adapter.model.name
        elseif chat.adapter.schema and chat.adapter.schema.model then
            model_name = chat.adapter.schema.model.default
        end
    end

    vim.g.codecompanion_current_model_name = model_name
EOF
    return ' (' . g:codecompanion_current_model_name . ')'
endfunction

function! GetObsessionStatus() abort
    if &filetype == 'codecompanion'
        return ''
    endif
    let status = ObsessionStatus()
    return status == '' ? '[N] ' : status.' '
endfunction

function! LightlineFilename()
    if &filetype == 'codecompanion'
        return '🤖 CodeCompanion' . CodeCompanionGetModel()
    endif
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let relativepath = expand('%:F') !=# '' ? expand('%:F') : '[No Name]'
    return winwidth(0) > 70 ? relativepath : filename
endfunction

function! LightlineFileformat()
    if &filetype == 'codecompanion'
        return ''
    endif
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileEncoding()
    if &filetype == 'codecompanion'
        return ''
    endif
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction

function! LightlineFiletype()
    if &filetype == 'codecompanion'
        return ''
    endif
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:filenameAndMethod = '%{GetObsessionStatus()}%{LightlineFilename()}'.
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
      \   'codecompanion': 'LightlineCodeCompanion',
      \   'fileformat': 'LightlineFileformat',
      \   'fileencoding': 'LightlineFileEncoding',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ }

" vista in lightline
if exists('g:loaded_vista')
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
endif
function! NearestMethodOrFunction() abort
    let method = get(b:, 'vista_nearest_method_or_function', '')
    return method != '' ? '   '.method : method
endfunction
