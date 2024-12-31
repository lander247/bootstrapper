#!/bin/sh

working_folder="$HOME/working"
config_folder="$HOME/.config"
git_folder="$HOME/Git"
local_folder="$HOME/.local"
bin_folder="$HOME/.local/bin"

mkdir "$working_folder"
mkdir "$config_folder"
mkdir "$git_folder"
mkdir "$local_folder"
mkdir "$bin_folder"

# Install important packages
# TODO: Make option for installing unnessecary packages (past firefox-esr)
sudo apt install \
  git \
  build-essential \
  libx11-dev \
  libxft-dev \
  libxinerama-dev \
  xorg \
  xinput \
  xwallpaper \
  xclip \
  dbus-x11 \
  picom \
  brightnessctl \
  flameshot \
  stow \
  curl \
  kitty \
  ssh \
  network-manager \
  pipewire
  
# TODO: Make option to pull these files only
cd "$working_folder"

# Install latest Neovim appimage
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x ./nvim.appimage
sudo mv nvim.appimage "$bin_folder/nvim"

# Get current keepass version
keepass_version="$(curl --silent "https://api.github.com/repos/keepassxreboot/keepassxc/releases/latest" | grep -Po "(?<=\"tag_name\": \").*(?=\")")"
keepass_file="KeePassXC-$keepass_version-x86_64.appimage"
# Pull keepass appimage from github
wget https://github.com/keepassxreboot/keepassxc/releases/latest/download/"$keepass_file"
chmod +x ./"$keepass_file"
sudo mv "$keepass_file" "$bin_folder/keepassxc"

rm -r "$working_folder"

cd "$git_folder"

git clone https://github.com/lander247/dotfiles
git clone https://github.com/lander247/dwm
git clone https://git.suckless.org/dmenu
git clone https://github.com/lander247/dwmblocks

echo "Done!"

sudo reboot now
