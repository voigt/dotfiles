all: sync

sync:
	mkdir -p ~/.ssh
	mkdir -p ~/.config/fish
#	mkdir -p ~/.config/alacritty

#	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/fishrc ~/.config/fish/config.fish
	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship ~/.config/starship.toml
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmuxconf ~/.tmux.conf
	[ -f ~/.git-prompt.sh ] || ln -s $(PWD)/git-prompt.sh ~/.git-prompt.sh
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.ssh/config ] || ln -s $(PWD)/sshconfig ~/.ssh/config

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.vimrc 
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.bashrc
	rm -f ~/.zshrc
	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/starship.toml
	rm -f ~/.tmux.conf
	rm -f ~/.git-prompt.sh
	rm -f ~/.gitconfig
	rm -f ~/.ssh/config
	rm -f ~/.zsh_history

.PHONY: all clean sync build run kill
