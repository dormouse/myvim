set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.


" plugin on GitHub repo
" for chinese input 
Plugin 'vim-scripts/VimIM'
" for file tree list
Plugin 'scrooloose/nerdtree'
" for comment quickly
Plugin 'scrooloose/nerdcommenter'

" plugin from http://vim-scripts.org/vim/scripts.html
" taglist
Plugin 'taglist.vim'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins;
"                     append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
"                     append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""
" Key mapping "
"""""""""""""""
map <F5> :!python %<CR>
map <F8> :w<CR>:!python3 %<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TlistToggle<CR>


""""""""""""""""""
" Plugin setting "
""""""""""""""""""
" NerdCommenter
let g:NERDSpaceDelims = 1

" Taglist
let Tlist_Show_One_File = 1 " Only current file's tlist
let Tlist_Exit_OnlyWindow = 1 " If only tlist left, then quit vim
let Tlist_Auto_Open=1
let Tlist_Use_Right_Window = 1 " Show in right window

" vimim
" 在 Insert 模式下用 Ctrl-_ 激活输入法
" Ctrl-6轮换选择不同的输入法
" 为了方便中文标点符号（全角字符的顿号双引号和单引号）的输入
let g:Vimim_punctuation = 3
" 原本Vimim 支持baidu、google、sogou、qq四个云输入法，但是由于google
" 在国内不能访问，sogou和qq更改了云输入方式，现在能用的云输入法只有baidu了。
let g:Vimim_cloud='baidu'

"""""""""""""""""
" Other setting "
"""""""""""""""""
set autoindent
set columns=85
set colorcolumn=80
set expandtab 
set foldmethod=syntax
set foldmethod=indent
set ignorecase
set shiftwidth=4
set tabstop=4 
set lines=40
set number
set nobackup

colorscheme slate

"解决中文字符显示半个的问题
set ambiwidth=double

"""""""""""""""""""""""""""""
"解决windows下的中文乱码问题
"""""""""""""""""""""""""""""
set encoding=utf-8
"set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
    "解决中文菜单乱码
    set langmenu=zh_CN.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "解决console输出乱码
    language messages zh_cn.utf-8
    "设置字体
    "取得当前使用的字体：set guifont?
    "如果字体名称中含有空格，需要在空格前面加上一个反斜杠(\)：
    "set guifont=Terminal:h18:b:cANSI
    set guifont=Fixedsys
elseif has('mac')
    set fileencoding=utf-8
    set guifont=PT\ Mono:h22
elseif has('unix')
    set fileencoding=utf-8
    set guifont=文泉驿等宽微米黑\ 11
endif

"""""""""""""""""""""""
" 设定 vimdiff 的颜色 "
"""""""""""""""""""""""
if &diff
    set tw=80 columns=180
    " 设定超过的部份会自动换行，适合搭配显示行号使用
    " Add 代表新增的一行， Delete 代表删除的一行，
    " Change 代表有差异的一行，Text 代表有差异的这一行中，具有差异的部份
    hi DiffAdd ctermfg=Grey ctermbg=Blue guifg=Black guibg=LightBlue
    hi DiffDelete ctermfg=Grey ctermbg=Grey guifg=Grey
    hi DiffChange ctermfg=Black ctermbg=DarkGreen guifg=Black guibg=LightGray
    hi DiffText ctermfg=Black ctermbg=Grey guifg=Black guibg=Gray
endif

