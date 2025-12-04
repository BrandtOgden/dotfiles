#!/usr/bin/env bash
set -e

# Configuration variables
APT_PACKAGES=(
    build-essential
    gdb
    vim
    curl
    ripgrep
    python3
    python3-pip
    npm
    stow
    git
    xclip
    zsh
    unzip
    tmux
    texlive-base
    latexmk
    zathura
)
NVIM_VERSION="v0.11.2"
STOW_DIRS=(
    nvim
    vim
    zsh
    bash
    shell
    tmux
    zathura
)

update_install() {
    echo "[*] Updating system..."
    sudo apt-get update && sudo apt-get upgrade -y

    echo "[*] Installing apt packages..."
    sudo apt-get install -y "${APT_PACKAGES[@]}"

    # Install neovim from the specified version (borrowed from nvim INSTALL.md)
    echo "[*] Installing Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/download/"$NVIM_VERSION"/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm -rf nvim-linux-x86_64.tar.gz

    echo "[*] Installing Rust..."
    curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
    source "$HOME/.cargo/env"

    if [ ! -d "$ZSH" ]; then
        echo "[*] Installing Oh My Zsh..."
        RUNZSH=no KEEP_ZSHRC=yes \
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        # A custom plugin for using system clipboard with vi-mode in Zsh
        git clone https://github.com/kutsan/zsh-system-clipboard ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-system-clipboard
    fi

    echo "[*] Installing TPM"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

link() {
    echo "[*] Symlinking configuration files..."
    for stow_dir in "${STOW_DIRS[@]}"; do
        stow "$stow_dir"
    done
}

help() {
    echo -e "Configuration manager/installer\n"
    echo "Usage: setup.sh <option>"
    echo "Options:"
    echo -e "\t-a, --all - install all specified packages, and create configuration symlinks"
    echo -e "\t-l, --links - only add/update the symlinks"
    echo -e "\t-p, --packages - only install packages"
    exit 1
}

if [[ $# != 1 ]]; then
    help
fi

case "$1" in 
    -a | --all)
        update_install 
        link;;
    -l | --links)
        link;;
    -p | --packages)
        update_install;;
    *)
        help;;
esac

echo "[+] Setup sucessful. If installing packages restart shell"

