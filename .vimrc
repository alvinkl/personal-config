set nocompatible              " be iMproved, required
filetype off                  " required

let g:ale_emit_conflict_warnings = 0

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

Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'prettier/vim-prettier'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'nathanaelkane/vim-indent-guides'
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

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" autocmd VimEnter * so $MYVIMRC

autocmd BufWinEnter * NERDTreeMirror
autocmd BufWritePre *.{js,jsx} ALEFix

let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
" autocmd BufEnter * lcd %:p:h

" KEYMAP
" Clear last search highlighting
map <Space> :noh<cr>
map <C-Space> :set nofoldenable!<cr>
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
nnoremap <C-S-Right> :vsp<cr>
nnoremap <C-S-Left> :sp<cr>
nnoremap <D-Bslash> :NERDTreeToggle<cr>
nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> 9gt
nnoremap <D-0> :tablast<cr>
nnoremap ® :NERDTreeFind<cr>
" nmap <D-s> <Plug>(Prettier) \| :w<CR>
noremap <D-s> :ALEFix<CR> \| :w<CR>
vnoremap <D-s> :ALEFix<CR> \| :w<CR>
inoremap <D-s> :ALEFix<CR> \| :w<CR>
nmap <D-w> :tabclose<cr>
" END OF KEYMAP

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" emmet
let g:user_emmet_class_name = "className"
let g:user_emmet_expandabbr_key = '<Tab>'

let g:user_emmet_settings = {'javascript.jsx':{'extends':'jsx'}}

autocmd FileType jsx set syntax=javascript.jsx
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
autocmd FileType html,css,javascript.jsx EmmetInstall


" vim indent guide
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Prettier Config
" let g:prettier#quickfix_enabled = 0
" let g:prettier#autoformat = 0
" " autocmd BufWritePre,TextChanged,InsertLeave *.js, *.jsx, *.mjs, *.ts, *.tsx, *.css, *.less, *.scss,*.scss,*.json,*.graphql,*.md PrettierAsync
" " autocmd BufWritePre,TextChanged,InsertLeave *.js, *.jsx, *.mjs, *.ts, *.tsx, *.css, *.less, *.scss,*.scss,*.json,*.graphql,*.md PrettierAsync

" let g:prettier#config#tab_width = 4
" let g:prettier#config#user_tabs = 'true'
" let g:prettier#config#semi = 'true'
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#bracket_spacing = 'true'
" let g:prettier#config#jsx_bracket_same_line = 'true'
" let g:prettier#config#trailing_comma = 'es5'
" let g:prettier#config#parser = 'babylon'

" ALE config
let g:airline#extensions#ale#enabled = 1

" let g:ale_set_loclist = 1
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_list_window_size = 3
" let g:ale_keep_list_window_open = 0

" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_filetype_changed = 0

let g:ale_set_highlights = 1

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
" disable the Ale HTML linters
let g:ale_linters = {
\   'html': [],
\}
let g:ale_set_highlights = 0

" stop Elm.vim trying to show compiler erorrs in Vim
let g:elm_format_fail_silently = 1

" set Prettier up to run on save
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
\ 'eslint'
\]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

" ctrlp
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set runtimepath^=~/.vim/bundle/ctrlp.vim

" VIM
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML
let loaded_matchparen = 1 " Turn off match parentheses

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set copyindent
set preserveindent
set softtabstop=0

set number relativenumber
set nonumber norelativenumber  " turn hybrid line numbers off
set number relativenumber    " toggle hybrid line numbers

set clipboard=unnamed

set nofoldenable    " disable folding
" Setup for Vim-icons
set guifont=DroidSansMono_Nerd_Font:h14
set encoding=utf8
" set guifont=DroidSansMono_Nerd_Font:h11

let g:NERDTreeChDirMode       = 2
let NERDTreeIgnore = ['\.DS_Store$']
let g:ctrlp_working_path_mode = 'rw'

syntax on
let base16colorspace=256
" colorscheme base16-tomorrow-night
colorscheme base16-material
