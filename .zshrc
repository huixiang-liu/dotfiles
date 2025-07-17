# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    npm
    python
    pip
    brew
)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Aliases
alias jut='just unit-test'
alias tg='turbo generate-types'
alias rp='just dev-replace'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Node.js aliases
alias nr='npm run'
alias ni='npm install'
alias nid='npm install --save-dev'

# History configuration
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
