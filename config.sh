sudo apt install zsh kitty neofetch picom ranger rofi i3status  i3blocks filezilla vlc ffmpeg feh lxappearance nitrogen lsd bat xclip maim pulseaudio-utils openssh-client samba fonts-font-awesome playerctl zsh-autosuggestions zsh-syntax-highlighting git cmus 

# Install oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
