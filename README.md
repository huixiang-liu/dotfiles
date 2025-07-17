# Dotfiles

Personal configuration files for development environment setup.

## Contents

- `.gitconfig` - Git configuration with useful aliases and settings
- `.zshrc` - Zsh shell configuration with Oh My Zsh setup
- `.bashrc` - Bash shell configuration
- `.vimrc` - Vim editor configuration
- `.gitignore_global` - Global gitignore patterns
- `.tmux.conf` - Tmux terminal multiplexer configuration
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

3. Update your organization information in `.gitconfig`:
   - Replace "Your Name" with your actual name
   - Replace "your.work.email@organization.com" with your organization email address

## What the installation script does

- Creates backups of existing dotfiles in `~/.dotfiles_backup_YYYYMMDD_HHMMSS`
- Creates symbolic links from your home directory to the dotfiles in this repository
- Configures git to use the global gitignore file
- Installs Claude Code CLI tool
- Installs zsh (if not present) and sets it as the default shell

## Post-installation

- **Shell**: Restart your terminal to use zsh as the default shell
- **Zsh users**: Run `source ~/.zshrc` to apply changes immediately  
- **Tmux users**: Start tmux or run `tmux source-file ~/.tmux.conf`
- **Claude Code**: The `claude` command should be available in your terminal

## Features

### Git Configuration
- Useful aliases (`gs`, `ga`, `gc`, `gp`, `gl`, etc.)
- Better log formatting
- Auto-rebase on pull
- Global gitignore

### Shell Configuration
- Command aliases for common operations
- Docker shortcuts
- Node.js/npm shortcuts
- Enhanced history settings
- Colorized output

### Vim Configuration
- Line numbers and relative line numbers
- Smart indentation
- Search highlighting
- Backup and undo file management
- Useful key mappings

### Tmux Configuration
- Ctrl-a prefix key
- Intuitive pane splitting
- Mouse support
- Vi-mode key bindings
- Custom status bar

### Development Tools
- **Claude Code**: AI-powered coding assistant CLI
- **Zsh**: Modern shell with Oh My Zsh configuration
- **Git**: Optimized configuration with useful aliases

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