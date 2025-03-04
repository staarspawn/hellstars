#!/bin/bash

# Install Zsh
echo "Installing Zsh..."
sudo pacman -S --noconfirm zsh

# Install Oh My Zsh
echo "Installation de Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Définir la variable ZSH_CUSTOM si non définie
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Installer les plugins
echo "Installation des plugins Zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Modifier le fichier .zshrc pour activer les plugins
echo "Update .zshrc..."
sed -i 's/^plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' ~/.zshrc

# Modifier le thème Zsh
echo "Update themes..."
sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="agnoster"/' ~/.zshrc

# Lancer Zsh
echo "A new shell has spawn..."
exec zsh
