.PHONY: install
install: | autoload/plug.vim plugged

autoload/plug.vim:
	mkdir -p autoload
	curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > $@

plugged:
	vim -u vimrc +'PlugInstall --sync' +qa
