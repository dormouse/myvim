set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set lines=40 columns=85
set autoindent
set shiftwidth=4
set tabstop=4 
set expandtab 
set nu
set nobackup
colorscheme peaksea

"一旦一行的字符超出80个的话就把那些字符的背景设为红色
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"搜索时忽略大小写
set ignorecase

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
else
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

"""""""""""
" 设定TAG "
"""""""""""
set foldmethod=syntax " 用语法高亮来定义折叠
set foldmethod=indent " 更多的缩进表示更高级别的折叠(这个似乎效果好一些)
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的。
let Tlist_Exit_OnlyWindow = 1 "如果 taglist 窗口是最后一个窗口，则退出 vim。
let Tlist_Auto_Open=1 "自动打开Tlist
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示 taglist 窗口。

"""""""""""""""""""
" F5 运行当前程序 "
"""""""""""""""""""
map <F5> <ESC>: call RunCurrentScript()<CR>

function RunCurrentScript()
    w
    if &filetype == "python"
        !python %
    elseif &filetype == "c"
        !cc -o %:r % && ./%:r
    endif
endfunction

