# My config files
My zsh configs in terminal

```
# Make a git directory someplace to store your config
git init ~/git/dotfiles

# Move your config to the git directory
mv ~/.zshrc ~/git/dotfiles/zshrc

# Link the config's new location into your $HOME
ln -s ~/git/dotfiles/zshrc ~/.zshrc

# Manage your new repo in its specific location
cd ~/git/dotfiles
git add zshrc
git commit -m"Initial commit"
```
