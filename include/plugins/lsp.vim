Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'liuchengxu/vista.vim'

let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_verbose = 0
let g:lsp_log_file = expand('/tmp/lsp.log')

" If the clangd binary exists, we register the LSP server
" and tell vim to use it for omni-completion.
if executable('clangd')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'clangd',
		\ 'cmd': {server_info->['clangd', '--compile-commands-dir=' . getcwd()]},
		\ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
	\ })
endif

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> H <plug>(lsp-hover)
endfunction

augroup lsp_install
	au!
	au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:vista_default_executive = 'vim_lsp'
let g:vista#renderer#enable_icon = 0

nnoremap <silent> <C-t> :Vista finder<CR>
