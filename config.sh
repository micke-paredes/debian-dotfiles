sudo apt install zsh kitty neofetch picom ranger rofi i3status  i3blocks filezilla vlc ffmpeg feh lxappearance nitrogen lsd bat xclip maim pulseaudio-utils openssh-client samba fonts-font-awesome playerctl zsh-autosuggestions zsh-syntax-highlighting git cmus bashtop
# Install oh_my_zsh, p10k and fonts
wget  https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip &&
mkdir ~/.local/share/fonts && 
unzip Hack.zip -d ~/.local/share/fonts && 
rm  *.zip
sudo fc-cache -v
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Install ZSH plugins (autosuggestions autocomplete syntax-highlighting fzf)
cd ~/.oh-my-zsh/plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Rofi
mkdir -p ~/.local/share/rofi/themes
git clone https://github.com/lr-tech/rofi-themes-collection.git &&
mv rofi-themes-collection/themes/* ~/.local/share/rofi/themes/

git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
