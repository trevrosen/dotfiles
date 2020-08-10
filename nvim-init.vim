"
"
" Basic Ergonomics
"
"
"
imap jk <Esc>
let mapleader = ","
set number

" Cmd-S to save (make sure to map in iTerm via keyboard shortcut mapped to escape sequence "[17~")
nnoremap <F6> :w<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>
filetype plugin on

" Use system Python3 location
let g:python3_host_prog = "/usr/local/bin/python3"

" ----- BEGIN PLUGINS -----
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kien/ctrlp.vim'
Plug 'mhartington/oceanic-next'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets',
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'hashivim/vim-terraform'
Plug 'tsandall/vim-rego'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'pedrohdz/vim-yaml-folds'

if !has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'	
  "
" code completion
let g:deoplete#enable_at_startup = 1
endif



call plug#end()
" ----- END PLUGINS -----

if !has('nvim')
  set directory=~/.vim/swapfiles//
endif

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" --- Material theme setup ---
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

if has("gui_running")
  set guifont=Menlo\ Bold:h14
endif

let g:airline_theme='oceanicnext'

" Highlight current line incurrent file
set cursorline
hi cursorline cterm=none  term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline


"
" NERDTree config
"
" Open automatically on all directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
" (cribbed from Janus config)
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1
let NERDTreeShowBookmarks = 1


"
"
"  Code config (autocomplete, etc)
"
"

" Trigger ultiSnip with Ctrl-J
let g:UltiSnipsExpandTrigger="<c-j>"

" Set Ruby indentation
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" SilverSearcher instead of Ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --vimgrep'
endif

" Configuration for ack-vim
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" fix imports and format on save
let g:go_fmt_command = "goimports"

" Turn on nice highlighting for all the things
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1


"
" Terraform
"
let g:terraform_fmt_on_save=1

"
" YAML
"
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
set foldlevelstart=20

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
set foldlevelstart=20

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

"
" Terminal colors
"

" Taken from Oceanic Material theme used in iTerm
" NOTE: not entirely correct yet, but close enough for the :term not to be
" terrible
let g:terminal_ansi_colors = [
 	\ '#313131', '#6f8184',
 	\ '#cddc38', '#cddc38',
 	\ '#ff6a64', '#ff5d4e',
 	\ '#ff5c93', '#e13573', 
	\ '#4acfff', '#4fb5f7',
 	\ '#ffdc50', '#ffca43',
 	\ '#00fcff', '#00b9cc',
 	\ '#f7f7f7', '#f7f7f7',
 	\]
