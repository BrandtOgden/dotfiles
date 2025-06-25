#!/usr/bin/env bash
set -e

# Configuration variables
APT_PACKAGES=(
    vim
    curl
    make
    ripgrep
    python3
    python3-pip
    npm
    stow
    git
    xclip
)
NVIM_VERSION="v0.11.2"
STOW_DIRS=(
    nvim
    vim
    zsh
    shell
)


echo "[*] Updating system..."
sudo apt-get update && sudo apt-get upgrade -y

echo "[*] Installing apt packages..."
for pkg in "${APT_PACKAGES[@]}"; do
    sudo apt-get install -y "$pkg"
done

# Install neovim from the specified version (borrowed from nvim INSTALL.md)
echo "[*] Installing neovim..."
curl -LO https://github.com/neovim/neovim/releases/download/"$NVIM_VERSION"/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm -rf nvim-linux-x86_64.tar.gz

echo "[*] Symlinking configuration files..."
for stow_dir in "${STOW_DIRS[@]}"; do
    stow "$stow_dir"
done

echo "[+] Installation sucessful"
