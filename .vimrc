"==============================================================================
" .vimrc
"==============================================================================

"==============================================================================
" 必須設定
"==============================================================================

" GVim's settings
if has('gui_running')
    set guioptions+=T
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    set antialias
    set fuoptions=maxvert,maxhorz
    set lines=300
endif
"==============================================================================
" 文字コード
"==============================================================================

set encoding=utf-8
set fileencodings=iso-2022-jp,iso-2022-jp-2,utf-8,euc-jp,sjis,cp932
" 上記の順でエンコードされるためutf8へのマクロを登録
nnoremap <F8> :set fenc=utf8<CR>

"==============================================================================
" 日本語入力関係
"==============================================================================

"------------------------------------------------------------------------------
" 挿入モードをぬける時強制でIME off (macはKeyRemap4MacBookで対応)
if has('win32')||has('win64')||('win32unix')
    "手立てなし
endif
"==============================================================================
" 検索関係
"==============================================================================

" 大文字小文字を区別しない
set ignorecase

" 検索文字に大文字がある場合は大文字小文字を区別
set smartcase

" インクリメンタルサーチ
set incsearch

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
" cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
" cnoremap <expr> / getcmdtype() == '?' ? '\?' : '?'

"==============================================================================
" 編集関係
"==============================================================================

" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround

" 補完時に大文字小文字を区別しない
set infercase

" カーソルを文字が存在しない部分でも動けるようにする
set virtualedit=all

" バッファを閉じる代わりに隠す(Undo履歴を残すため)
set hidden

" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen

" 対応する括弧などをハイライト表示する
set showmatch

" 対応括弧のハイライト表示を3秒にする
set matchtime=3

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" ハイフンやアンダーバー区切りのワードを一つの単語として扱う
setlocal iskeyword& iskeyword+=-,_

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    " set clipboard& clipboard+=unnamedplus
    set clipboard& clipboard+=unnamedplus,unnamed
else
    " set clipboard& clipboard+=unnamed,autoselect
    set clipboard& clipboard+=unnamed
endif

" Swapファイル?Backupファイル?前時代的すぎなので全て無効化する
set nowritebackup
set nobackup
set noswapfile

" インデント関係を共通設定
set autoindent
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set expandtab tabstop=4 shiftwidth=4 softtabstop=4

" 最終変更箇所を記憶し次回ファイルを開いたときそこにカーソルが行くようにする
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"==============================================================================
" 表示関係
"==============================================================================

" 行番号の表示
set number

" 長いテキストの折り返し
set wrap

" 自動的に改行が入るのを無効化
set textwidth=0

" 代わりに80文字目にラインを入れる
set colorcolumn=80

" 前時代敵スクリーンベルを無効化
set visualbell t_vb=

" エラーメッセージの表示時にビープ音を鳴らさない
set noerrorbells

set hlsearch

" マウス操作を可能にする
" set mouse=a

" ファイルの更新があると自動で再読み込み
set autoread

" カーソルの位置情報を表示する　＊ステータスバー
set ruler

" コマンドラインの行数
set cmdheight=2

" ウィンドウに常にステータスを表示する
set laststatus=2

" 端末にタイトル(ほぼフィアル名)を表示
set title

" 行間の幅を設定(単位は不明)
set linespace=0

" 画面中央から移動できるカーソル幅
set scrolloff=10

"==============================================================================
" マクロおよびキー設定
"==============================================================================

" Leaderとmaplocalleaderの変更
let g:mapleader = ','
let g:maplocalleader = 'm'

" ノーマルモードで特定のキーのマッピングを解放する 
nnoremap , <Nop>
xnoremap , <Nop>

" 入力モード中に<C-j>と入力した場合はESCとみなす
inoremap <C-j> <ESC>

" ビジュアルモード中も<C-j>と入力した場合はESCとみなす
vnoremap <C-j> <ESC>

" ESCを二回押すことでハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-j><C-j> :nohlsearch<CR>

" コマンドモードの履歴で<Up><Down>をつかわない
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" バッファ移動をマッピングする
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" カーソル下の単語を * で検索 
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索語にジャンプした際、検索単語を画面の中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j,kによる移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + ? でウィンドウ間を移動
" nnoremap <C-h> <C-w>w
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" .vimrcと.gvimrcをキーバインドで開く、リロード
nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>gv :<C-u>edit $MYGVIMRC<CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
                \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction
"==============================================================================
" プラグイン関係
"==============================================================================
" dein settings
if &compatible
    set nocompatible               
endif

" Required: dein.vim
set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim  
" Required:
call dein#begin(expand('~/.vim'))
  
" Let dein manage dein
" Required:  
call dein#add('Shougo/dein.vim')

call dein#add('Shougo/vimproc')
let g:vimproc#download_windows_dll = 1

call dein#add('Shougo/unite.vim')
" unite設定
nnoremap [unite] <Nop>
nmap <Space>f [unite]
"インサートモードで開始しない
let g:unite_enable_start_insert = 0

call dein#add('Shougo/vimfiler.vim')
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_deault = 0
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

call dein#add('tpope/vim-surround')

" Add or remove your plugins here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required: easymotion
call dein#add('easymotion/vim-easymotion')
nmap s <plug>(easymotion-s2)
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvb'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade ctermbg=none ctermfg=blue
let g:EasyMotion_use_migemo = 1

call dein#add('nathanaelkane/vim-indent-guides')

if has('python3')
    call dein#add('davidhalter/jedi-vim')
    let g:jedi#auto_initialization=1
    let g:jedi#auto_vim_configuration=1

    nnoremap [jedi] <Nop>
    xnoremap [jedi] <Nop>
    nmap <Leader>j [jedi]
    xmap <Leader>j [jedi]

    let g:jedi#completions_command="<C-n>"
    let g:jedi#goto_assignments_command="<C-g>"
    let g:jedi#goto_definitions_command="<C-d>"
    let g:jedi#documentation_command="<C-k>"
    let g:jedi#rename_command="[jedi]r"
    let g:jedi#usages_command="[jedi]n"
    let g:jedi#popup_select_first=0
    let g:jedi#popup_on_dot=0

    autocmd FileType python setlocal completeopt-=preview
endif


call dein#add('itchyny/lightline.vim')

call dein#add('itchyny/landscape.vim')

" colorscheme landscape
if !has('gui_running')
    set t_Co=256
endif
let g:lightline = {
            \'colorscheme': 'landscape',
            \ }

" Required:
filetype plugin indent on
"
" If you ...から下の部分のコメントアウトを外しておく
" " If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------
