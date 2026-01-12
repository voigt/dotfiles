all: sync

sync:
	mkdir -p ~/.ssh
	mkdir -p ~/.config/fish
	mkdir -p ~/.config/zellij
	mkdir -p ~/.config/aerospace
	mkdir -p ~/.config/ghostty


	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/fishrc ~/.config/fish/config.fish
	[ -f  ~/.config/atuin/config.toml ] || ln -s $(PWD)/atuin ~/.config/atuin/config.toml
	[ -f  ~/.config/ghostty/config ] || ln -s $(PWD)/ghostty ~/.config/ghostty/config
	[ -f  ~/.config/helix/config.toml ] || ln -s $(PWD)/helix ~/.config/helix/config.toml

	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship ~/.config/starship.toml
#	[ -f ~/.config/zellij/config.kdl ] || ln -s $(PWD)/zellij ~/.config/zellij/config.kdl
	[ -f ~/.config/zellij/config.kdl ] || cp $(PWD)/zellij ~/.config/zellij/config.kdl
	[ -f ~/.config/aerospace/aerospace.toml ] || ln -s $(PWD)/aerospace ~/.config/aerospace/aerospace.toml

	[ -f ~/.git-prompt.sh ] || ln -s $(PWD)/git-prompt.sh ~/.git-prompt.sh
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.gitconfig-macos ] || ln -s $(PWD)/gitconfig-macos ~/.gitconfig-macos
	[ -f ~/.gitconfig-stackit ] || ln -s $(PWD)/gitconfig-stackit ~/.gitconfig-stackit
	[ -f ~/.ssh/config ] || ln -s $(PWD)/sshconfig ~/.ssh/config

	[ -f ~/Library/LaunchAgents/local.cvoigt.dark-notify.plist ] || ln -s $(PWD)/local.cvoigt.dark-notify.plist ~/Library/LaunchAgents/local.cvoigt.dark-notify.plist
	launchctl load ~/Library/LaunchAgents/local.cvoigt.dark-notify.plist

	[ -f ~/.ocmconfig ] || ln -s $(PWD)/ocmconfig ~/.ocmconfig

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.config/atuin/config.toml
	rm -f ~/.config/ghostty/config
	rm -f ~/.config/helix/config.toml
#	rm -f ~/.config/helix/themes

	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/starship.toml
	rm -f ~/.config/zellij/config.kdl
	rm -f ~/.config/aerospace/aerospace.toml
	rm -f ~/.git-prompt.sh
	rm -f ~/.gitconfig
	rm -f ~/.gitconfig-macos
	rm -f ~/.ssh/config
	rm -f ~/.zsh_history

	rm -f ~/Library/LaunchAgents/local.cvoigt.dark-notify.plist

	rm -f ~/.ocmconfig

.PHONY: all clean sync build run kill
