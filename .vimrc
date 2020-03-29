" <Leader> の設定 (参考: https://postd.cc/how-to-boost-your-vim-productivity)
let mapleader = "\<Space>"

"""""""""""""""""""""""""""""
" プラグイン管理 (vim-plug https://github.com/junegunn/vim-plug)
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Git を扱う
Plug 'tpope/vim-fugitive'
  " grep検索の実行後にQuickFix Listを表示する
  autocmd QuickFixCmdPost *grep* cwindow
  " ステータス行に現在のgitブランチを表示する
  set statusline+=%{fugitive#statusline()}

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'

" インデントに色を付けて見やすくする <== nerdtree にも色がつくのが嫌だった
" Plug 'nathanaelkane/vim-indent-guides'
"  let g:indent_guides_enable_on_vim_startup = 1

" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'

" ファイルツリー
Plug 'scrooloose/nerdtree'
  " 隠しファイルも表示対象に
  let NERDTreeShowHidden = 1

" ファイルツリーの状態を保持する
Plug 'jistr/vim-nerdtree-tabs'
  " 現在のファイルにフォーカスした状態でツリーを表示/ツリーを閉じる
  nnoremap <silent><Leader>t :NERDTreeTabsToggle<CR>
  nnoremap <silent><Leader>f :NERDTreeTabsFind<CR>
  " let g:nerdtree_tabs_autofind = 1
  " 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" git の状態をツリーにも表示
Plug 'Xuyuanp/nerdtree-git-plugin'

" 行末の半角スペースを可視化
" Plug 'bronson/vim-trailing-whitespace'

" カラースキーム
Plug 'cocopon/iceberg.vim'

" エディターコンフィグ
Plug 'editorconfig/editorconfig-vim'

" html シンタックスハイライト
Plug 'othree/html5.vim'

" javascript シンタックスハイライト
Plug 'othree/yajs.vim'

" 左端に git 差分表示
Plug 'airblade/vim-gitgutter'

" ステータスライン
Plug 'itchyny/lightline.vim'

" 構文チェック
Plug 'w0rp/ale'

" vim 日本語ドキュメント
Plug 'vim-jp/vimdoc-ja'

" markdown プレビュー
Plug 'iamcco/markdown-preview.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

""""""""""""""""""""""""""""""
" vim 設定
""""""""""""""""""""""""""""""

"文字コードをUFT-8に設定
set fenc=utf-8

" バックアップファイルを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 入力中のコマンドをステータスに表示する
set showcmd

" 全角文字表示のため
set ambiwidth=double

"タイトル部分にファイル名を表示する
set title

"行番号を表示
set number

" ファイル名表示
set statusline=%F

" 変更チェック表示
set statusline+=%m

" <BS>や<DEL>がうまく動作しないのを防止する
set backspace=indent,eol,start

" tabキーを押した際にはスペースを入れる（ソフトタブ有効化）
set expandtab

" 画面上でタブ文字が占める幅
set tabstop=2

" 自動インデントでずれる幅
set shiftwidth=2

" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" マウス操作有効化
" set mouse=a

" 編集行ハイライト
set cursorline

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" ファイルタイプの自動検出、ファイルタイプ用の プラグインとインデント設定 自動読み込み
" vim-plug では不要
" filetype plugin indent on

" ColorSchema の設定
" set termguicolors

syntax on

colorscheme iceberg

" 背景色
" set background=dark

" OSのクリップボードにコピー
" `$vim --version | grep clipboard` で clipboard の有効を確認
set clipboard+=unnamed

" 起動時のメッセージを表示しない
set shortmess+=I

" 行末の空白をファイル保存時に削除
augroup RemoveWhiteSpace
  autocmd!

  autocmd BufWritePre * :%s/\s\+$//ge
augroup END

""""""""""""""""""""""""""""""
" エイリアス
""""""""""""""""""""""""""""""

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" 検索時のハイライトを消す
nnoremap <ESC><ESC> :noh<CR>

" インサートでノーマルモードに戻るコマンドにjjも追加
inoremap jj <ESC>

" window の移動
nnoremap <Leader>w <C-w>
