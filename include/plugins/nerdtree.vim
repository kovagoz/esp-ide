Plug 'scrooloose/nerdtree'

let g:NERDTreeWinSize = 40
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeBookmarksSort = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeBookmarksFile = curdir . "/.NERDTreeBookmarks"

" Toggle file browser when press Ctrl+o
nnoremap <C-o> :NERDTreeToggle<CR>

" Locate file when press Ctrl+l
nnoremap <C-l> :NERDTreeFind<CR>
