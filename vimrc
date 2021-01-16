" Set Vim runtime directories
let curdir=expand('<sfile>:p:h')
let &runtimepath=curdir.",$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,".curdir."/after"
let &packpath=curdir.",$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,".curdir."/after"

" Set C include path
let &path .= "components/*/include,"
let &path .= $IDF_PATH . "/components/*/include,"
let &path .= $HOME . "/.espressif/tools/xtensa-esp32-elf/esp-2020r2-8.2.0/xtensa-esp32-elf/xtensa-esp32-elf/include"

set nocompatible
set noswapfile
set undolevels=100

set tabstop=4
set t_Co=256
set termwinsize=20x0
set backspace=start,indent,eol
set splitbelow

if has('gui_running')
	colorscheme macvim
	set guicursor+=a:blinkon0
	set linespace=3
	set title titlestring=%f
	set guioptions+=T
endif

" Search settings
set incsearch
set ignorecase
set smartcase
nnoremap <Space> /

let mapleader = ","

nmap <Leader>x :bd<CR>
nnoremap K ciw

" Load plugins
call plug#begin()

Plug 'editorconfig/editorconfig-vim'
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open=20

for f in split(glob(curdir . '/include/plugins/*.vim'), '\n')
    exe 'source' f
endfor

call plug#end()

" Restore position when file is opened
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif

" Open a new terminal at the bottom of the window (from Vim 8.1).
if exists(":term")
	nnoremap T :term<CR>
endif

" Show / hide line numbers
nnoremap <Leader>n :set nu!<CR>
hi LineNr ctermbg=White ctermfg=LightGray guibg=White guifg=ivory3

" Show vertical line at column 80
set colorcolumn=80
hi ColorColumn guibg=gray98 ctermbg=255

hi Comment ctermfg=LightGray guifg=LightGray

exe "source " . curdir . "/include/statusline.vim"
exe "source " . curdir . "/include/toolbar.vim"
