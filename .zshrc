# ----------------------
# SETUP
# ----------------------
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# ----------------------
# General Settings
# ----------------------
# export TERM="xterm-kitty"           # Terminal setting for Kitty
export LANG="en_US.UTF-8"           # Default language
export EDITOR="nvim"                # Set Neovim as the default editor
export PATH="/usr/local/bin:$PATH"  # Add Homebrew binaries to PATH
export PRETTIER_CONFIG="~/.config/prettier/.prettierrc"

export MallocNanoZone='0'

alias ls='ls -G'
# ----------------------
# Load Plugins
# ----------------------
# Syntax Highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # Suggestion color
bindkey '^ ' autosuggest-accept         # Ctrl+Space to accept suggestions

# History Substring Search
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Git Prompt Integration
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
zstyle ':vcs_info:git:*' formats '%F{yellow}[%b]%f' # Show Git branch

# ----------------------
# Prompt Configuration
# ----------------------
autoload -Uz vcs_info               # Enable Git info in the prompt
precmd () { vcs_info }              # Update Git info before each command
setopt prompt_subst                 # Allow prompt substitutions

PROMPT='%F{cyan}%n%f@%F{green}%m%f %F{yellow}%1~%f ${vcs_info_msg_0_} %# '

# ----------------------
# History Configuration
# ----------------------
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS         # Ignore duplicate history entries
setopt HIST_FIND_NO_DUPS            # Avoid duplicates when searching

# ----------------------
# Command-Line Tools
# ----------------------
# fzf-tab Configuration
zstyle ':completion:*' menu select      # Enable fzf-tab completion menu

# ----------------------
# Environment Variables
# ----------------------
export CF="$HOME/coding/codeforces"
export SCHOOL="$HOME/Northwestern/24-25/25Spring"

# ----------------------
# Functions
# ----------------------
export ZSH_FUNCTIONS_DIR=~/zsh-functions
for func in $ZSH_FUNCTIONS_DIR/*.zsh; do
  source $func
done

# ----------------------
# Aliases
# ----------------------
alias ll='ls -lh'                   # List files in human-readable format
alias la='ls -lha'                  # Include hidden files
alias g='git'                       # Shorter git command
alias e=$EDITOR                      # Open Neovim

# ----------------------
# vi-mode Configuration
# ----------------------
bindkey -v                          # Enable vi mode keybindings
export KEYTIMEOUT=1                 # Faster switching between modes

export DISPLAY=:0

alias k='kitty @ launch && kitty @ launch && kitty @ launch'

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

#
# automatically open in tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  if tmux has-session -t default 2>/dev/null; then
    tmux attach -t default
  else
    # Create a new session named "default", set the cwd,
    # name the window "term", and run `nvim +terminal` in it.
    tmux new-session \
      -s default \
      -n term \
      -c "$PWD" \
#       "nvim +terminal"
  fi
fi

# nvim terminal shit. testing
# Only when running inside `:terminal` in (Neo)Vim
# ~/.zshrc, **no** if-block around it
# autoload -Uz add-zsh-hook
# add-zsh-hook chpwd _vim_sync_PWD
# function _vim_sync_PWD() {
#   # 1) emit the OSC 51 escape invisibly
#   printf '%b' "\e]51;[\"call\",\"Tapi_lcd\",\"%q\"]\007" "$PWD"
#   # 2) print a visible marker so you know the hook ran
#   echo "::HOOK:: $PWD" >&2
# }
