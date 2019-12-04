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

" ----- BEGIN PLUGINS -----
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kien/ctrlp.vim',
Plug 'mhartington/oceanic-next'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets',
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'

call plug#end()
" ----- END PLUGINS -----

" --- Material theme setup ---
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
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
"imap <C-j> <esc>a<Plug>snipMateNextOrTrigger
let g:UltiSnipsExpandTrigger="<c-j>"

" Set Ruby indentation
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

" SilverSearcher instead of Ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --vimgrep'
endif

" Configuration for ack-vim
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" code completion
let g:deoplete#enable_at_startup = 1

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
