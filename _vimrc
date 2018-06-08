" Windows����
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible " be iMproved

" ��ֹ����
set noundofile
set nobackup
set noswapfile
" �������ַ�����
set hlsearch
set path+=**
set wildmenu
" leader ��
let mapleader = ','
"����backspace��������ʽ
set backspace=indent,eol,start
"����ʱ���ؼ��ָ���
set hls
"������Vim�п���ʹ����� ��ֹ��Linux�ն����޷�����
set mouse=a
" ����ճ����ϵͳ������
map <C-C> "+y<CR>
map <C-V> "+p<CR>
" ��������
"set modifiable
"����ctags�Ŀ�ݼ�Ϊ Ctrl-F12  
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>    
"��ʾ�к�
set number
"�����ڱ༭���������½���ʾ����������Ϣ
set ruler
"��һ�����ֺܳ�ʱȡ������
"set nowrap
"��״̬����ʾ�������������
set showcmd
"������ʷ��¼����
set history=1000
"����ȡ������ ��ֹ��ʱ�ļ�����
set nobackup
set noswapfile
"ͻ����ʵ��ǰ����
set cursorline
"set cursorcolumn
"����ƥ��ģʽ ���Ƶ�����һ��������ʱ��ƥ����Ӧ���Ǹ�������
set showmatch
"����C/C++��ʽ�Զ�����
set autoindent
set cindent
"�����﷨��������
syntax enable
syntax on
"��������ʱ���Դ�Сд
set ignorecase
"����Tab���
set tabstop=2
"�����Զ�����ո���
set shiftwidth=2
"���ð��˸��ʱ����һ��ɾ��4���ո�
set softtabstop=4
set smarttab
"��Tab���Զ�ת���ɿո� ������ҪTab��ʱʹ��[Ctrl + V + Tab]
set expandtab
"���ñ��뷽ʽ
set encoding=utf-8
""�Զ��жϱ���ʱ ���γ���һ�±���
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"����ļ�����
filetype on
"��Բ�ͬ���ļ����ò�ͬ��������ʽ
filetype indent on
"������
filetype plugin on
"�������ܲ�ȫ
filetype plugin indent on

filetype off " required! /** �����п�ʼ��vimrc���� **/

"""��Ҫ
" Linux����������
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" Windows����������
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'

" vim���߿���
Bundle 'L9'

"NerdTree ��ʾ��Ŀ��
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=31
let NERDTreeChDirMode=1
" ����ʾ��Ŀ���϶������Ϣ�������������ʾʲô��
let NERDTreeMinimalUI=1
map <C-Y> :NERDTreeToggle<CR>
" ������������ Vim ʱ�Զ�������Ŀ��
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" �������ļ��ر�ʱ�ر���Ŀ������
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ����ʾ��Щ�ļ�
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree

" TagBar  use <F3> ������ת����
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='ctags'          "ctags�����·��
let g:tagbar_width=35                   "���ڿ�ȵ�����
let g:tagbar_right=1                     "����
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

" ��ǿ״̬��
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

" ����ע��
" <Leader>cc ע�� <Leader>cu ��ע��
Bundle 'scrooloose/nerdcommenter'

"ctrlp
Bundle 'kien/ctrlp.vim.git'
"<Leader>p������ǰĿ¼���ļ�
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
"<Leader>f����MRU�ļ�
nmap <Leader>f :CtrlPMRUFiles<CR>
"<Leader>b��ʾ�������ļ�������ͨ����Ž�����ת
nmap <Leader>b :CtrlPBuffer<CR>
"��������ʱ���Ե��ļ�
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
      \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
      \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"�޸�QuickFix������ʾ�������Ŀ��
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 1
"����MRU�����Ŀ��Ϊ20
let g:ctrlp_mruf_max = 20
let g:ctrlp_follow_symlinks = 1
"Ĭ��ʹ��ȫ·����������1���ļ���������׼ȷ�ʻ�������ߣ�������<C-d>�����л�
let g:ctrlp_by_filename = 0
"Ĭ�ϲ�ʹ��������ʽ����1��ΪĬ��ʹ��������ʽ��������<C-r>�����л�
let g:ctrlp_regexp = 0
"�Զ��������б����ʾ��
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

" ��������
Plugin 'Yggdroot/indentLine'
let g:indentLine_showFirstIndentLevel = 1

" Tab��ȫ
Plugin 'SuperTab'
let g:SuperTabRetainCompletionType=2

" ������ 
" ���ֶ�copy��colorĿ¼��
Plugin 'git://github.com/tomasr/molokai.git'
"molokai ���� monokai�Ľ�����
set t_Co=256
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" ���ֶ�copy��colorĿ¼��
Plugin 'ayu-theme/ayu-vim' " or other package manager
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
"colorscheme ayu

" SimpylFold ����
Plugin 'tmhedberg/SimpylFold'
set foldmethod=indent
"�ÿո����л��۵�״̬
nnoremap <space> za  

" C++������չ
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

call vundle#end()
filetype plugin indent on " required! /** vimrc�ļ����ý��� **/


" Windows����
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
