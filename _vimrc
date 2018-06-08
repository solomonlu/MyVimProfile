" Windows独有
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible " be iMproved

" 禁止备份
set noundofile
set nobackup
set noswapfile
" 搜索逐字符高亮
set hlsearch
set path+=**
set wildmenu
" leader 键
let mapleader = ','
"配置backspace键工作方式
set backspace=indent,eol,start
"搜索时，关键字高亮
set hls
"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a
" 复制粘贴到系统剪贴板
map <C-C> "+y<CR>
map <C-V> "+p<CR>
" 窗口缩放
"set modifiable
"设置ctags的快捷键为 Ctrl-F12  
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>    
"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap
"在状态栏显示正在输入的命令
set showcmd
"设置历史记录条数
set history=1000
"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile
"突出现实当前行列
set cursorline
"set cursorcolumn
"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
"设置C/C++方式自动对齐
set autoindent
set cindent
"开启语法高亮功能
syntax enable
syntax on
"设置搜索时忽略大小写
set ignorecase
"设置Tab宽度
set tabstop=2
"设置自动对齐空格数
set shiftwidth=2
"设置按退格键时可以一次删除4个空格
set softtabstop=4
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab
"设置编码方式
set encoding=utf-8
""自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on

filetype off " required! /** 从这行开始，vimrc配置 **/

"""重要
" Linux用这行配置
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" Windows用这行配置
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'

" vim工具库插件
Bundle 'L9'

"NerdTree 显示项目树
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=31
let NERDTreeChDirMode=1
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
map <C-Y> :NERDTreeToggle<CR>
" 当不带参数打开 Vim 时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree

" TagBar  use <F3> 函数跳转窗口
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=35                   "窗口宽度的设置
let g:tagbar_right=1                     "居右
let g:tagbar_type_ruby = {
      \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
      \ ]
      \ }
map <C-N> :Tagbar<CR>

" 增强状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'git://github.com/edkolev/tmuxline.vim.git'
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline_powerline_fonts = 1
let g:airline_theme='ayu_mirage'

map <C-H> :bp<CR>
map <C-L> :bn<CR>
map <C-B> :ls<CR>

" 快速注释
" <Leader>cc 注释 <Leader>cu 解注释
Bundle 'scrooloose/nerdcommenter'

"ctrlp
Bundle 'kien/ctrlp.vim.git'
"<Leader>p搜索当前目录下文件
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
"<Leader>f搜索MRU文件
nmap <Leader>f :CtrlPMRUFiles<CR>
"<Leader>b显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>b :CtrlPBuffer<CR>
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
      \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
      \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 1
"设置MRU最大条目数为20
let g:ctrlp_mruf_max = 20
let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 0
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
let g:ctrlp_line_prefix = '? '

Bundle 'dkprice/vim-easygrep.git'
"<Leader>vv  - Grep for the word under the cursor, match all occurences,
"              like |gstar|
"<Leader>vV  - Grep for the word under the cursor, match whole word, like
              "|star|
"<Leader>va  - Like vv, but add to existing list
"<Leader>vA  - Like vV, but add to existing list
"<Leader>vr  - Perform a global search on the word under the cursor
              "and prompt for a pattern with which to replace it.
"<Leader>vo  - Select the files to search in and set grep options
"<Leader>vy* - Invoke any option from the options explorer, where * is the
              "shortcut for that option.
              "e.g. <Leader>vyr - toggles recursion
                   "<Leader>vyb - sets buffer grepping mode
                   "etc.
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2, 
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "tags"
let g:EasyGrepFilesToExclude = "*.bak"
let g:EasyGrepFilesToExclude = "*~"
let g:EasyGrepFilesToExclude = "cscope.*"
let g:EasyGrepFilesToExclude = "*.a"
let g:EasyGrepFilesToExclude = "*.o"
let g:EasyGrepFilesToExclude = "*.pyc"
let g:EasyGrepFilesToExclude = "*.log"

" 缩进线条
Plugin 'Yggdroot/indentLine'
let g:indentLine_showFirstIndentLevel = 1

" Tab补全
Plugin 'SuperTab'
let g:SuperTabRetainCompletionType=2

" 主题插件 
" 需手动copy到color目录下
Plugin 'git://github.com/tomasr/molokai.git'
"molokai 主题 monokai的进化版
set t_Co=256
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" 需手动copy到color目录下
Plugin 'ayu-theme/ayu-vim' " or other package manager
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
"colorscheme ayu

" SimpylFold 配置
Plugin 'tmhedberg/SimpylFold'
set foldmethod=indent
"用空格来切换折叠状态
nnoremap <space> za  

" C++高亮扩展
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

call vundle#end()
filetype plugin indent on " required! /** vimrc文件配置结束 **/


" Windows独有
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
