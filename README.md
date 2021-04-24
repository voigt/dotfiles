dotfiles
========

My personal dotfiles. 

Please only open pull requests that fix bugs or adds improvements without any
breaking changes.

These dotfiles are very personal, and I know that everyone has a different
taste; hence fork this repository or copy/paste them into your own `dotfiles`
repo.

# On a new machine

```
# install all brew dependencies
brew bundle

# copy dotfiles to the appropriate places
make

# make zsh the new default
chsh -s /bin/zsh

# activate fzf fuzzy search and `ctrl+r`
$(brew --prefix)/opt/fzf/install

# setup vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# open vim and install all plugins
:PlugInstall

# install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# disable font smoothing
defaults -currentHost write -g AppleFontSmoothing -int 0

# show hidden files in Finder
defaults write com.apple.Finder AppleShowAllFiles true
# enable tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Increase key repeat speed (lower is faster)
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 4
```
