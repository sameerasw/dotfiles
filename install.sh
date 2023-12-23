#!/usr/bin/env bash

DOTFILES="$(pwd)"

echo "restoring data"
sudo dnf update -y
sudo dnf install -y git zsh wget curl rsync timeshift npm

#links to home
ln -s /git/ ~/git
ln -s /data/ ~/Data

#font
mkdir ~/temp/
cd ~/temp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip
unzip Hack.zip
mv *.ttf ~/.fonts
mv *ttf ~/.local/share/fonts
sudo mv *.ttf /usr/share/fonts/
fc-cache -fv
rm -fr ~/temp/

#omzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm -f ~/.zshrc
ln -s /git/dotfiles/zshrc ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

rm -f ~/.p10k.zsh
ln -s /git/dotfiles/p10k.zsh ~/.p10k.zsh

#setup keyd
cd /git/keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
sudo mkdir /etc/keyd/
sudo ln -s ~/git/dotfiles/keyd/*.conf /etc/keyd/
sudo keyd reload

#setup edge

