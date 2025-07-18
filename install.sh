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
backup_and_link ".zshrc"
backup_and_link ".vimrc"

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
    zsh_path=$(which zsh)
    current_shell=$(dscl . -read /Users/$USER UserShell 2>/dev/null | awk '{print $2}' || echo "$SHELL")
    
    if [ "$current_shell" != "$zsh_path" ]; then
        echo "Current shell: $current_shell"
        echo "Changing default shell to zsh: $zsh_path"
        
        # Add zsh to /etc/shells if not present
        if ! grep -q "$zsh_path" /etc/shells 2>/dev/null; then
            echo "Adding $zsh_path to /etc/shells..."
            echo "$zsh_path" | sudo tee -a /etc/shells > /dev/null
        fi
        
        # Change default shell
        if command -v chsh >/dev/null 2>&1; then
            echo "Running: chsh -s $zsh_path"
            chsh -s "$zsh_path" && echo "✓ Default shell changed to zsh" || {
                echo "❌ Failed to change shell automatically"
                echo "Please run manually: chsh -s $zsh_path"
            }
        else
            echo "❌ chsh command not found"
            echo "Please change your default shell manually in system settings"
        fi
    else
        echo "✓ zsh is already the default shell"
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

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "Oh My Zsh installed successfully!"
else
    echo "Oh My Zsh already installed"
fi

echo "Dotfiles installation complete!"
echo "Backup of original files saved in: $BACKUP_DIR"
echo ""
echo "To apply changes:"
echo "  - Close and reopen your terminal (or restart your terminal app)"
echo "  - If shell didn't change, run manually: chsh -s $(which zsh)"
echo ""
echo "Note: You may need to restart your terminal application or log out/in"
echo "to see the zsh shell change take effect."