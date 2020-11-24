set encoding=utf-8
scriptencoding utf-8
"保存時の文字コード"
set fileencoding=utf-8
"読み込み時の文字コード自動判別"
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
"改行コードの自動判別"
set fileformats=unix,dos,mac
"文字崩れを解決"
set ambiwidth=double
"タブ入力をスペース二変換"
set expandtab
"タブ文字の幅"
set tabstop=4
"連続した空白に対して動くカーソルの幅"
set softtabstop=4
"改行時に前の行のインデント継続"
set autoindent
"改行時に前の構文チェックを行いインデントの増減をする"
set smartindent
"その時増減する幅"
set shiftwidth=4
"一文字入力毎に検索をする"
set incsearch
"検索パターンに大文字小文字を区別しない"
set ignorecase
"検索文字に大文字が入っていたら区別する"
set smartcase
"検索結果をハイライト"
set hlsearch
"カーソル移動で行末から次の行頭へ"
set whichwrap=b,s,h,l,<,>,[,],~
"行番号表示"
set number
"カーソルラインをハイライト"
set cursorline
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
"バックスペースの有効化"
set backspace=indent,eol,start
"括弧の対応を一瞬表示する"
set showmatch
"vimの「％」を拡張する"
source $VIMRUNTIME/macros/matchit.vim
"コマンドモードの補完"
set wildmenu
"保存するコマンド履歴の数"
set history=5000
"以下マウスの有効化"
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif
"以下ペースト時にインデントを作成しない設定"
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"vundleの初期化"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"vundleをvundleで管理"
Bundle 'gmarik/vundle'
"ファイル形式検出プラグインインデントをON"
filetype plugin indent on
"------以下プラグイン------"
"vim-indent-guides(インデントのハイライト)"
Bundle 'nathanaelkane/vim-indent-guides'
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
"自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
"molokai(カラースキーム)"
Bundle 'tomasr/molokai'
"---------------------------------------------------------"
" molokaiの設定"
"----------------------------------------------------------"
"色をつける"
set t_Co=256
"構文に色をつける"
syntax enable
"vim-trailing-whitespace (末尾の全角と半角の空白文字を赤くハイライト)"
Bundle "bronson/vim-trailing-whitespace"
Bundle "tpope/vim-fugitive"
