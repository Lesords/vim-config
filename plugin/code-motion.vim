" code block movement
function! s:moveup_line()
	let cur_pos = getpos('.')	"获取当前光标位置
	"如果已经是最上一行，则直接返回
	if cur_pos[1] == 1
		return
	endif
	let tgt_line = cur_pos[1] - 1	"获得上一行的行号
	let tmp = getline(tgt_line)		"将上一行的内容临时存储
	call setline(tgt_line,getline(cur_pos[1]))	"将上一行的内容替换成当前行
	call setline(cur_pos[1],tmp)	"将当前行的内容替换成上一行
	let cur_pos[1] -= 1	"将当前光标的行号减1,得到目标位置"
	call setpos('.',cur_pos)	"修改当前光标位置
endfunction

function! s:movedown_line()
	let cur_pos = getpos('.')	"获取当前光标位置
	"如果已经是最底一行，则直接返回
	if cur_pos[1] == line('$')
		return
	endif
	let tgt_line = cur_pos[1] + 1	"获得下一行的行号
	let tmp = getline(tgt_line)		"将下一行的内容临时存储
	call setline(tgt_line,getline(cur_pos[1]))	"将下一行的内容替换成当前行
	call setline(cur_pos[1],tmp)	"将当前行的内容替换成下一行
	let cur_pos[1] += 1	"将当前光标的行号+1,得到目标位置"
	call setpos('.',cur_pos)	"修改当前光标位置
endfunction

function! s:moveup_multlines() range
	"获取选择范围的端点的位置信息
	let start_mark = getpos("'<")
	let end_mark = getpos("'>")
	"对代码块的位置进行判断，当已经为最顶层时，直接退出函数
	if start_mark[1] == 1
		return
	endif
	"利用getling()和setline()内置函数实现代码块整体移动
	let save_curpos = getpos('.')
	let buffer_lines = getline(start_mark[1],end_mark[1])
	call add(buffer_lines, getline(start_mark[1] - 1))
	call setline(start_mark[1]-1,buffer_lines)
	"调整选区范围和当前光标的位置
	let start_mark[1] -= 1
	let end_mark[1] -= 2
	let save_curpos[1] -= 2
	call setpos("'<",start_mark)
	call setpos("'>",end_mark)
	call setpos('.',save_curpos)
endfunction

function! s:movedown_multlines() range
	"获取选择范围的端点的位置信息
	let start_mark = getpos("'<")
	let end_mark = getpos("'>")
	"对代码块的位置进行判断，当已经为最底层时，直接退出函数
	if end_mark[1] == line('$')
		return
	endif
	"利用getling()和setline()内置函数实现代码块整体移动
	let save_curpos = getpos('.')
	let buffer_lines = [getline(end_mark[1] + 1)]
	call extend(buffer_lines, getline(start_mark[1],end_mark[1]) )
	call setline(start_mark[1],buffer_lines)
	"调整选区范围和当前光标的位置
	let start_mark[1] += 1
	let end_mark[1] += 1
	let save_curpos[1] += 1
		call setpos("'<",start_mark)
	call setpos("'>",end_mark)
	call setpos('.',save_curpos)
endfunction



if has('gui_running')
    noremap <silent> <A-K> :call <SID>moveup_line()<CR>
    noremap <silent> <A-J> :call <SID>movedown_line()<CR>
    inoremap <silent> <A-K> <ESC>:call <SID>moveup_line()<CR>a
    inoremap <silent> <A-J> <ESC>:call <SID>movedown_line()<CR>a
    vnoremap <silent> <A-K> :call <SID>moveup_multlines()<CR>gv "后面必须添加‘gv’才可重新进入可视模式
    vnoremap <silent> <A-J> :call <SID>movedown_multlines()<CR>gv
endif

noremap <silent> K :call <SID>moveup_line()<CR>
noremap <silent> J :call <SID>movedown_line()<CR>
inoremap <silent> K <ESC>:call <SID>moveup_line()<CR>a
inoremap <silent> J <ESC>:call <SID>movedown_line()<CR>a
vnoremap <silent> K :call <SID>moveup_multlines()<CR>gv "后面必须添加‘gv’才可重新进入可视模式
vnoremap <silent> J :call <SID>movedown_multlines()<CR>gv
