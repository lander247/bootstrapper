#!/bin/sh

working_folder="$HOME/working"
config_folder="$HOME/.config"
git_folder="$HOME/Git"
local_folder="$HOME/.local"
bin_folder="$HOME/.local/bin"

mkdir "$working_folder"
mkdir "$git_folder"
mkdir "$local_folder"
mkdir "$bin_folder"
mkdir "$config_folder"

# Install important packages
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
  kitty

# Extra packages
# TODO: Make option for installing extra packages
sudo apt install \
  firefox-esr \
  pavucontrol \
  unzip \
  imagemagick \
  ssh \
  pulseaudio \
  network-manager \
  ufw 

cd "$working_folder"
# TODO: Make option to pull these files only

# Install latest Neovim appimage
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x ./nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install latest KeepassXC appimage
keepass_version="$(curl --silent "https://api.github.com/repos/keepassxreboot/keepassxc/releases/latest" | grep -Po "(?<=\"tag_name\": \").*(?=\")")"
wget https://github.com/keepassxreboot/keepassxc/releases/latest/download/KeePassXC-"$keepass_version"-x86_64.appimage
chmod +x ./KeePassXC-"$keepass_version"-x86_64.appimage
sudo mv KeePassXC-"$keepass_version"-x86_64.appimage ~/.local/bin/keepassxc

rm -r "$working_folder"

cd "$git_folder"

git clone https://github.com/lander247/dotfiles
git clone https://github.com/lander247/dwm
git clone https://git.suckless.org/dmenu

echo "Done!"
