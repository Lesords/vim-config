set nocompatible    " 关闭 vi 兼容模式
set mouse=a         " 启动鼠标模式
set shiftwidth=4    " 设置缩进的空格数位4
set tabstop=4       " 设置 Tab 键宽度为 4 个空格
set expandtab       " 将 tab 转换为空格
set smartindent     " 智能选择对齐方式
set cindent         " 设置使用 C/C++ 语言的自动缩进方式
set cinoptions=g0,N-s,(0
set autoindent      " 设置自动缩进
set autoread        " 文件变化时自动重读
set number          " 显示行号
set relativenumber  " 显示相对行号
set ruler           " 显示光标位置
set showmatch       " 高亮显示匹配的括号
set showcmd         " 右下角显示命令
set smartcase       " 搜索时智能匹配大小写
set wildmenu        " 使用 Tab 键补全时，在状态栏显示匹配的列表
set hlsearch        " 高亮匹配结果
set cursorline      " 突出显示当前行
set confirm         " 在处理 未保存 和 只读文件 的时候，弹出确认
set noerrorbells    " 关闭错误提示音
set nobackup        " 取消备份文件
set noundofile      " 取消 undo 文件
set t_Co=256
set t_kD=[3~
set tags=./tags;,./TAGS,tags,TAGS
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936    " 自动识别编码格式, 逗号分割不加空格

if !has('nvim')
    set ttymouse=sgr
endif

if has('clipboard')
    set clipboard=unnamedplus
endif

" defaut path: /usr/share/vim/vim80/debian.vim
set backspace=indent,eol,start

if v:version < 802
    set fillchars=vert:\⎜,fold:-
else
    set fillchars=eob:\ ,vert:\┃,fold:-
endif

syntax   on
syntax   enable     " 设置语法高亮度
filetype on         " 开始文件类型侦测
filetype plugin on  " 加载对应文件类型插件
filetype indent on  " 自适应不同语言的智能缩进
