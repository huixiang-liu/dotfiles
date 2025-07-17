#!/bin/bash

# Dotfiles installation script

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Function to backup and link files
backup_and_link() {
    local file="$1"
    local target="$HOME/$file"
    
    if [ -e "$target" ]; then
        echo "Backing up existing $file to $BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
    fi
    
    echo "Linking $file"
    ln -sf "$DOTFILES_DIR/$file" "$target"
}

# Install dotfiles
backup_and_link ".gitconfig"
backup_and_link ".zshrc"
backup_and_link ".bashrc"
backup_and_link ".vimrc"
backup_and_link ".gitignore_global"
backup_and_link ".tmux.conf"

# Update git global gitignore
git config --global core.excludesfile ~/.gitignore_global

echo "Dotfiles installation complete!"
echo "Backup of original files saved in: $BACKUP_DIR"
echo ""
echo "Please update the following in ~/.gitconfig:"
echo "  - Your name and email address"
echo ""
echo "To apply changes:"
echo "  - For zsh: source ~/.zshrc"
echo "  - For bash: source ~/.bashrc"
echo "  - For tmux: tmux source-file ~/.tmux.conf"