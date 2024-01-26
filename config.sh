sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y wget zsh kitty neofetch picom ranger rofi i3status  i3blocks filezilla vlc ffmpeg feh lxappearance nitrogen lsd bat xclip maim pulseaudio-utils openssh-client samba fonts-font-awesome playerctl zsh-autosuggestions zsh-syntax-highlighting git cmus nodejs npm apache2 default-mysql-client default-mysql-server default-mysql-server-core mysql-common ufw libhidapi-libusb0 python3-pip thunderbird pavucontrol
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev

# Rofi
mkdir -p ~/.local/share/rofi/themes
git clone https://github.com/lr-tech/rofi-themes-collection.git &&
mv rofi-themes-collection/themes/* ~/.local/share/rofi/themes/

# Install oh_my_zsh, p10k and fonts
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
wget  https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip &&
mkdir ~/.local/share/fonts && 
unzip Hack.zip -d ~/.local/share/fonts && 
rm  *.zip
sudo fc-cache -v


# Install ZSH plugins (autosuggestions autocomplete syntax-highlighting fzf)
cd ~/.oh-my-zsh/plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Make config directories
mkdir -p ~/.config/i3 ~/.config/rofi ~/.config/picom

# Make config directories
mkdir -p ~/.config/i3 
mkdir -p ~/.config/rofi 
mkdir -p ~/.config/picom

# replace zsrch, i3, picom files
rm ~/.zshrc
rm ~/.config/i3/config
mv zshrc-template ~/.zshrc
mv i3-config ~/.config/i3/config
mv picom-template ~/.config/picom/picom.conf

# Alternating layout
git clone https://github.com/olemartinorg/i3-alternating-layout
cd i3-alternating-layout
sudo mv alternating_layouts.py /bin/alternating_layouts.py

# i3 lock color
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./build.sh
./install-i3lock-color.sh

# Config samba


# Starting services
sudo systemctl enable apache2
sudo systemctl enable mysql
sudo service apache2 start
sudo service mysql start

# pip dependencies
python3 -m pip install --upgrade pip --break-system-packages
pip install i3ipc bumblebee-status netifaces youtube-dl --break-system-packages

# Streamdeck config
PATH=$PATH:$HOME/.local/bin
sudo sh -c 'echo "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"0fd9\", TAG+=\"uaccess\"" > /etc/udev/rules.d/70-streamdeck.rules'
sudo udevadm trigger
python3 -m pip install streamdeck-ui --user --break-system-packages

# Snap
sudo apt install snapd
sudo systemctl start snapd
sudo systemctl enable snapd
sudo systemctl start snapd.apparmor
sudo systemctl enable snapd.apparmor

sudo snap install zoom-client postman beekeeper-studio discord docker arduino
sudo snap install kubectl --classic
sudo snap install code --classic
