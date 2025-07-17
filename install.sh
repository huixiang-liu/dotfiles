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

# Install Claude Code via npm
echo "Installing Claude Code..."
if command -v npm >/dev/null 2>&1; then
    npm install -g @anthropic-ai/claude-code
    echo "Claude Code installed successfully!"
else
    echo "Warning: npm not found. Please install Node.js and npm first, then run:"
    echo "  npm install -g @anthropic-ai/claude-code"
fi

# Set zsh as default shell
echo "Setting zsh as default shell..."
if command -v zsh >/dev/null 2>&1; then
    # Get current user's shell
    current_shell=$(getent passwd "$USER" 2>/dev/null | cut -d: -f7)
    zsh_path=$(which zsh)
    
    if [ "$current_shell" != "$zsh_path" ]; then
        echo "Changing default shell to zsh..."
        if grep -q "$zsh_path" /etc/shells 2>/dev/null; then
            chsh -s "$zsh_path" 2>/dev/null && echo "Default shell changed to zsh" || {
                echo "Note: Please run 'chsh -s $zsh_path' manually to set zsh as default shell"
                echo "You may need to enter your password"
            }
        else
            echo "Note: zsh path not in /etc/shells. Please add '$zsh_path' to /etc/shells"
        fi
    else
        echo "zsh is already the default shell"
    fi
else
    echo "Installing zsh..."
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y zsh
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y zsh
    elif command -v brew >/dev/null 2>&1; then
        brew install zsh
    else
        echo "Please install zsh manually for your system"
    fi
fi

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