Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Disable file preview
let $FZF_DEFAULT_OPTS = '--reverse --preview-window=right:hidden'

" Show fzf window on bottom of Vim
let g:fzf_layout = { 'down': '40%' }

" Own history file
let &viminfo = &viminfo . ',n' . curdir . '/.viminfo'

" Show recent files when when TAB is pressed
nnoremap <Tab> :History<CR>

" Cmd+Shift+a brings up the available Vim commands
nmap <D-A> :Commands<CR>

" Open file
nmap <C-f> :Files<CR>
