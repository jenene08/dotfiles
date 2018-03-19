" jedi用にpathを追加
let $PATH = "/usr/local/var/pyenv/shims".$PATH
" Vundlevim
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
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" My plugins
" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'
" monokai
Plugin 'https://github.com/sickill/vim-monokai.git'
" python
Plugin 'https://github.com/davidhalter/jedi-vim.git'
" Dont show docstring
autocmd FileType python setlocal completeopt-=preview
" Autopep8
Plugin 'https://github.com/tell-k/vim-autopep8.git'
" Set F8 to do autopep8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
" Don't show diff window  
let g:autopep8_disable_show_diff=1
" vim-pyenv(Make path to pyenv in vim)
Plugin 'https://github.com/lambdalisue/vim-pyenv.git'
" Syntax checking
Plugin 'https://github.com/vim-syntastic/syntastic.git'
" c++
Plugin 'https://github.com/justmao945/vim-clang.git'
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

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" タブをスペースに置き換える (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" いい感じにインデントする
set smartindent
" 自動で挿入されるインデントのスペース幅
set smarttab
set shiftwidth=4
"tab キーを押した時に挿入されるスペース量
set softtabstop=0
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1    " ぶら下り可能幅
" エンコーディング
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le
scriptencoding
" 検索時に全て英小文字で入力した場合のみ区別を無視する
set smartcase
" 検索した際に最後の語句の次に最初の語句にループしないようにする
set nowrapscan
" バックアップファイルの保存先指定
set backupdir=$HOME/.vimbackup
" バックスペースの挙動を変更
set backspace=indent,eol,start
" yank したテキストをクリップボードに格納する
set clipboard=unnamed,autoselect
" 全角スペースをハイライト
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" 背景色をターミナルと同じにする
" 参考
" http://tech.alters.co.jp/vimrc/vimrc%E3%81%AEcolor%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97%E4%B8%80%E8%A6%A7/
" autocmd ColorScheme * highlight Normal ctermbg=none
" autocmd ColorScheme * highlight NonText ctermbg=none
" autocmd ColorScheme * highlight LineNr ctermbg=none

" シンタックス
syntax on
" カラースキーム
colorscheme monokai

"フォントを指定
set guifont=Ricty:h14
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示,nolist:非表示)
set nolist
" どの文字でタブや改行を表示するかを設定(表示しないように)
set listchars=
" set listchars=tab:,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータ,行に表
set showcmd
" タイトルバーの表示を消す
set notitle
" ビープ音を消す
set vb t_vb=
if has('mouse')
  set mouse=a
endif
" -------------------------------------------------------------------------
" jedi-vim (Plugin for Python)
" Use Python in Pyenv
if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let major_version = pyenv#python#get_internal_major_version()
    call jedi#force_py_version(major_version)
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif
" -------------------------------------------------------------------------
" syntastic Syntax checker
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
