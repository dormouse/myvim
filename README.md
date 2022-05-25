# How to Install this project

```Shell
git clone git@github.com:dormouse/myvim.git ~/.vim
sudo apt-get install exuberant-ctags 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vim/vimrc ~/.vimrc
cp ~/.vim/vimim.wubijd.txt ~/.vim/bundle/VimIM/plugin/
```

Open Gvim and Run: `:PluginInstall`

# My vim for python develop

## 命令提要

* `za` 开关折叠

* `zR` 打开所有折叠

* `Ctrl+w + v` 垂直拆分

* `Ctrl+w + s` 水平拆分

* `Ctrl+w + q` 关闭当前窗口

* `Ctrl+w + w` 切换窗口

* `Ctrl+w + k` 切换到上边窗口

* `Ctrl+w + j` 切换到下边窗口

* `Ctrl+w + h` 切换到左边窗口

* `Ctrl+w + l` 切换到右边窗口

* `<leader>td` 打开任务列表

* `<leader>g` 打开历史版本

* `<leader>8` 进行 Pep8 自动修复

* `<leader>k` 查看文档

* `:e <filename>` 打开新的文件

* `:b<number>`    切换到第 <number> 个缓冲区

* `:bn`           切换到下一个缓冲区

* `:bd` 或 `:bw`  关闭当前缓冲区

* `<leader>n` 打开文件树

* `<leader>a` 显示搜索命令

* `<leader>r` 运行 python 程序

* `<leader>j` 转到定义位置

  

## 安装

1. Set up [Vundle](http://github.com/VundleVim/Vundle.vim):

   `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

2. Configure Plugins:

   Put this at the top of your `.vimrc` to use Vundle. Remove plugins you don't need, they are for illustration purposes.

   ```
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
   Plugin 'tpope/vim-fugitive'
   " plugin from http://vim-scripts.org/vim/scripts.html
   " Plugin 'L9'
   " Git plugin not hosted on GitHub
   Plugin 'git://git.wincent.com/command-t.git'
   " git repos on your local machine (i.e. when working on your own plugin)
   Plugin 'file:///home/gmarik/path/to/plugin'
   " The sparkup vim script is in a subdirectory of this repo called vim.
   " Pass the path to set the runtimepath properly.
   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
   " Install L9 and avoid a Naming conflict if you've already installed a
   " different version somewhere else.
   " Plugin 'ascenator/L9', {'name': 'newL9'}
   
   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   filetype plugin indent on    " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   "
   " Brief help
   " :PluginList       - lists configured plugins
   " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
   " :PluginSearch foo - searches for foo; append `!` to refresh local cache
   " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
   "
   " see :h vundle for more details or wiki for FAQ
   " Put your non-Plugin stuff after this line
   ```

3. Install Plugins:

   Launch `vim` and run `:PluginInstall`

   To install from command line: `vim +PluginInstall +qall`初始化

## 使用说明

### 代码折叠

* `za` 开关折叠
* `zR` 打开所有折叠

在 ~/.vimrc 中加入以下内容：

    " code folding
    set foldmethod=indent
    set foldlevel=99

### 拆分窗口

* `Ctrl+w + v` 垂直拆分
* `Ctrl+w + s` 水平拆分
* `Ctrl+w + q` 关闭当前窗口
* `Ctrl+w + w` 切换窗口
* `Ctrl+w + k` 切换到上边窗口
* `Ctrl+w + j` 切换到下边窗口
* `Ctrl+w + h` 切换到左边窗口
* `Ctrl+w + l` 切换到右边窗口

在窗口之间移动原来使用 `Ctrl+w + <movement>` ，现改为 `Ctrl+<movement>` 。
在 ~/.vimrc 中加入以下内容：

    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h

### 代码片断

插件 snipmate 提供了插入代码片断功能。

例如键入 `def<tab>` ，就会看到插入了预定义的代码片断。

定义自己的代码片断：

    $ mkdir ~/.vim/snippets
    $ vim ~/.vim/snippets/python.snippets

在文件中输入如下内容：

    snippet pdb
        import pdb; pdb.set_trace()

现在如果输入 `pdb<tab>` ，就可以看到效果。

### 任务列表

* `<leader>td` 打开任务列表
* `q`           关闭任务列表
* 回车          跳到文件相应内容

插件 tasklist 提供了任务列表功能，可以查看所有打开的文件中含有 `FIXME` 、
`TODO` 和 `XXX` 字样的行。

在 ~/.vimrc 中加入以下内容：

    map <leader>td <Plug>TaskList

### 历史版本

`<leader>g` 打开历史版本

插件 Gundo 提供了历史版本功能。

在 ~/.vimrc 中加入以下内容：

    map <leader>g :GundoToggle<CR>

### 语法高亮

在 ~/.vimrc 中加入以下内容以开启语法高亮：

    syntax on                    " syntax highlighing
    filetype on                  " try to detect filetypes
    filetype plugin indent on    " enable loading indent file for filetype

### 语法检查

设置 pyflakes 不使用 quickfix 窗口：

    let g:pyflakes_use_quickfix = 0

### Pep8 语法自动修复

`<leader>8` 进行 Pep8 自动修复

插件 python-mode 提供了 pep8 检查功能。

在 ~/.vimrc 中加入以下内容：

    map <leader>8 :PymodeLintAuto<CR>

### Tab 补全

在 ~/.vimrc 中加入以下内容：

    au FileType python set omnifunc=pythoncomplete#Complete
    let g:SuperTabDefaultCompletionType = "context"

### python 文档查看

`<leader>K` 查看文档

插件 python-mode 提供了查看文档功能。

### 缓冲区

* `:e <filename>` 打开新的文件
* `:b<number>`    切换到第 <number> 个缓冲区
* `:bn`           切换到下一个缓冲区
* `:bd` 或 `:bw`  关闭当前缓冲区

minibufexpl 插件带来了更好的缓冲区管理功能。

### 文件树

`<leader>n` 打开文件树

插件 NERD Tree 提供了文件树检查功能。

在 ~/.vimrc 中加入以下内容：

    map <leader>n :NERDTreeToggle<CR>

### 搜索

`<leader>a` 显示搜索命令

插件 ack 提供了强大的查询功能。在 ~/.vimrc 中加入以下内容：

    nmap <leader>a <Esc>:Ack!

末尾的感叹号表示只显示命令，不立即执行。
