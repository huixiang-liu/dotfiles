# Dotfiles

Personal configuration files for development environment setup.

## Contents

- `.zshrc` - Zsh shell configuration with Oh My Zsh setup
- `.vimrc` - Vim editor configuration
- `install.sh` - Installation script

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/huixiang-liu/dotfiles.git
   cd dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

3. Configure git if needed:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.work.email@organization.com"
   ```

## What the installation script does

- Creates backups of existing dotfiles in `~/.dotfiles_backup_YYYYMMDD_HHMMSS`
- Creates symbolic links from your home directory to the dotfiles in this repository
- Installs Claude Code CLI tool
- Installs zsh (if not present) and sets it as the default shell

## Post-installation

- **Shell**: Restart your terminal to use zsh as the default shell
- **Zsh users**: Run `source ~/.zshrc` to apply changes immediately  
- **Claude Code**: The `claude` command should be available in your terminal

## Features

### Shell Configuration
- **Zsh**: Modern shell with Oh My Zsh configuration
- Command aliases for common operations
- Docker shortcuts
- Node.js/npm shortcuts
- Enhanced history settings
- Colorized output

### Vim Configuration
- Basic display settings (line numbers, ruler)
- Smart search (incremental, case-insensitive)
- Proper indentation (4 spaces)
- Syntax highlighting
- Essential editing features

### Development Tools
- **Claude Code**: AI-powered coding assistant CLI
- **Oh My Zsh**: Plugin management and themes

## Customization

Feel free to modify these files to suit your preferences. The beauty of dotfiles is that they're personal!

## Organization Use

These dotfiles are designed for organization/team use:

1. **Team Setup**:
   - This repository should be hosted on your personal GitHub account
   - Share the repository URL with your organization team members
   - Each team member clones and installs using the same process

2. **Installation for team members**:
   ```bash
   git clone https://github.com/huixiang-liu/dotfiles.git
   cd dotfiles
   ./install.sh
   ```

3. **Customization for your organization**:
   - Update `.gitconfig` with organization-specific settings
   - Modify shell aliases to match your team's workflow
   - Add organization-specific vim/tmux configurations
   - Commit and push changes for the whole team

## License

Feel free to use and modify these configurations as you see fit.