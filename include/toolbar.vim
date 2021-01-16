function! BuildFinished()
	if g:asyncrun_code == 0
		cclose
		echo "👍 Build complete"
	else
		echohl WarningMsg
		echo "😢 Build failed"
		echohl None
	endif
endfunction

function! BuildProject()
	silent AsyncRun -post=call\ BuildFinished() idf.py build
endfunction

tmenu ToolBar.menuconfig Configuration
tmenu ToolBar.monitor Serial monitor
tmenu ToolBar.build Build project
tmenu ToolBar.flash Flash MCU

au GUIEnter * aunmenu *
au GUIEnter * amenu ToolBar.menuconfig :term ++close ++rows=15 make menuconfig<CR>
au GUIEnter * amenu ToolBar.monitor :term ++close ++rows=20 idf.py monitor<CR>
au GUIEnter * amenu ToolBar.build :call BuildProject()<CR>
au GUIEnter * amenu ToolBar.flash :term ++close ++rows=10 idf.py flash<CR>
