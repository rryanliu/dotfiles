1.
git clone --bare https://github.com/rliu2400/dotfiles.git $HOME/.dotfiles

2.
echo "alias dotfiles='git --git-dir=\$HOME/.dotfiles --work-tree=\$HOME'" >> ~/.zshrc

3.
source ~/.zshrc

4.
dotfiles config --local status.showUntrackedFiles no

5.
rm .zshrc

6.
dotfiles checkout

7.
With homebrew installed, in the home directory, run

brew bundle
