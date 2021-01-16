Plug 'tomtom/tcomment_vim', { 'on': 'TComment' }

" Toggle comments when press Cmd+/
nnoremap <D-/> :TComment<CR>
vnoremap <D-/> :TComment<CR>

hi Comment ctermfg=LightGray guifg=LightGray
