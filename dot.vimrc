"---------------------------
" 一般設定
"---------------------------
set encoding=utf-8
scriptencoding utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
" □や○文字が崩れる問題を解決"
set ambiwidth=double
" 行数を表示する
set number
set backspace=indent,eol,start
" ヤンクした時にクリップボードにコピーする
set clipboard=unnamed,autoselect

" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" smartindentで増減する幅"
set shiftwidth=4

" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト"
set hlsearch

" 不可視文字を可視化(タブが「?-」と表示される)
set list listchars=tab:\?\-

" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~

" カーソルラインをハイライト"
set cursorline

set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

" remap for vimgrep and quickfix

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

autocmd QuickFixCmdPost *grep* cwindow

"---------------------------
" Start Neobundle Settings.
"---------------------------

" 準備"
"  sudo npm install -g eslint
"  mkdir -p ~/.vim/bundle
"  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" プラグインはここに追加"

" JsDoc でJSDocコメントができる。"
NeoBundleLazy 'heavenshell/vim-jsdoc' , {'autoload': {'filetypes': ['javascript']}}
" gfでrequire()のモジュールにジャンプ"
NeoBundle 'moll/vim-node'
" インデントとシンタックスカラー用プラグイ"
NeoBundle 'pangloss/vim-javascript'
" 括弧を入力した際、自動的にとじ括弧を挿入してくれるプラグイン。"
NeoBundle 'Townk/vim-autoclose'
" シンタックスチェック用プラグイン。
" この設定ではESLintでチェックさせています。
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_check_on_wq = 0 " wqではチェックしない
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
set statusline+=%#warningmsg# "エラーメッセージの書式
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint'] "ESLintを使う
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': []
      \ }

" プラグインでvim上でNode.jsを実行できる
NeoBundle 'thinca/vim-quickrun'
" 水平に分割する
let g:quickrun_config={'*': {'split': ''}}

" プラグイン追加 ここまで"

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

" toggle between paste mode and nonpaste mode
set pastetoggle=<F3>

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
