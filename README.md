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
   git clone https://github.com/yourusername/dotfiles.git
   cd dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

3. Update your personal information in `.gitconfig`:
   - Replace "Your Name" with your actual name
   - Replace "your.email@example.com" with your email address

## What the installation script does

- Creates backups of existing dotfiles in `~/.dotfiles_backup_YYYYMMDD_HHMMSS`
- Creates symbolic links from your home directory to the dotfiles in this repository
- Configures git to use the global gitignore file

## Post-installation

- **Zsh users**: Restart your terminal or run `source ~/.zshrc`
- **Bash users**: Restart your terminal or run `source ~/.bashrc`
- **Tmux users**: Start tmux or run `tmux source-file ~/.tmux.conf`

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

## Customization

Feel free to modify these files to suit your preferences. The beauty of dotfiles is that they're personal!

## Organization Use

When using these dotfiles in an organization setting:

1. Fork this repository to your personal GitHub account
2. Customize the configurations for your organization's standards
3. Share the repository with team members
4. Each team member can clone and install using the same process

## License

Feel free to use and modify these configurations as you see fit.