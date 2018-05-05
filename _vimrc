set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" ���ð���vundle�ͳ�ʼ����ص�runtime path
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" Linux�����������
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" ��һ��ѡ��, ָ��һ��vundle��װ�����·��
"call vundle#begin('~/some/path/here')

" ��vundle�������汾,����
Plugin 'VundleVim/Vundle.vim'

" ���·�������֧�ֲ�ͬ��ʽ�Ĳ����װ.
" �뽫��װ������������vundle#begin��vundle#end֮��.
" Github�ϵĲ��
" ��ʽΪ Plugin '�û���/����ֿ���'
" Plugin 'tpope/vim-fugitive'
" ���� http://vim-scripts.org/vim/scripts.html �Ĳ��
" Plugin '�������' ʵ������ Plugin 'vim-scripts/����ֿ���' ֻ�Ǵ˴����û�������ʡ��
" Plugin 'L9'
" ��Git֧�ֵ�����github�ϵĲ���ֿ� Plugin 'git clone ����ĵ�ַ'
" Plugin 'git://git.wincent.com/command-t.git'
" ���ص�Git�ֿ�(�����Լ��Ĳ��) Plugin 'file:///+���ز���ֿ����·��'
" Plugin 'file:///home/gmarik/path/to/plugin'
" ����ڲֿ����Ŀ¼��.
" ��ȷָ��·����������runtimepath. ���·��������sparkup/vimĿ¼��
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" ��װL9������Ѿ���װ�������������������¸�ʽ����������ͻ
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Install Vim-go  
Plugin 'fatih/vim-go' 

" ������в����Ҫ����������֮ǰ
call vundle#end()            " ����
filetype plugin indent on    " ���� ����vim�Դ��Ͳ����Ӧ���﷨���ļ�������ؽű�
" ���Ӳ���ı�����,����ʹ���������:
"filetype plugin on
"
" ��Ҫ�����ĵ�
" :PluginList       - �г����������õĲ��
" :PluginInstall    - ��װ���,׷�� `!` ���Ը��»�ʹ�� :PluginUpdate
" :PluginSearch foo - ���� foo ; ׷�� `!` ������ػ���
" :PluginClean      - ���δʹ�ò��,��Ҫȷ��; ׷�� `!` �Զ���׼�Ƴ�δʹ�ò��
"
" ���� :h vundle ��ȡ����ϸ�ں�wiki�Լ�FAQ
" �����Լ��Էǲ��Ƭ�η�������֮��


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

" ��ֹ����
set noundofile
set nobackup
set noswapfile

" ���ñ����Զ�ʶ��, ����������ʾ
set fileencodings=utf-8,gbk
set ambiwidth=double

"ColorScheme
colorscheme desert

" �����˸��ɾ����tab����  
set smartindent  
set smarttab  
set expandtab  
set tabstop=4  
set softtabstop=4  
set shiftwidth=4  
set backspace=2
set textwidth=79

" �������  
set mouse=a  
  
" �����к�  
set nu
