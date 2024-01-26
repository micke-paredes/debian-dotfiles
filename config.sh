sudo apt install -y zsh kitty neofetch picom ranger rofi i3status  i3blocks filezilla vlc ffmpeg feh lxappearance nitrogen lsd bat \
                    xclip maim pulseaudio-utils openssh-client samba fonts-font-awesome playerctl zsh-autosuggestions \ 
                    zsh-syntax-highlighting git cmus nodejs npm apache2 default-mysql-client default-mysql-server default-mysql-server-core \ 
                    mysql-common ufw libhidapi-libusb0 python3-pip thunderbird pavucontrol

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

# Config samba


# Starting services
sudo systemctl enable apache2
sudo systemctl enable mysql
sudo service apache2 start
sudo service mysql start

# pip dependencies
python3 -m pip install --upgrade pip
pip install i3ipc bumblebee-status netifaces youtube-dl

# Streamdeck config
PATH=$PATH:$HOME/.local/bin
sudo sh -c 'echo "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"0fd9\", TAG+=\"uaccess\"" > /etc/udev/rules.d/70-streamdeck.rules'
sudo udevadm trigger
python3 -m pip install streamdeck-ui --user

# Snap
sudo apt install snapd
sudo systemctl start snapd
sudo systemctl enable snapd
sudo systemctl start snapd.apparmor
sudo systemctl enable snapd.apparmor

sudo snap install zoom-client postman beekeeper-studio discord docker arduino
sudo snap install kubectl --classic
