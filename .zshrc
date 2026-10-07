# ==============================================================================
# Oh My Zsh & Plugins Setup
# ==============================================================================

export PATH=$PATH:/home/minhcreator/bin:/home/minhcreator/.local/bin:/home/minhcreator/.env

# bun completions
[ -s "/home/minhcreator/.bun/_bun" ] && source "/home/minhcreator/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ==============================================================================
# History Configuration
# ==============================================================================
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000000
SAVEHIST=1000000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS

# ==============================================================================
# SHELL behaviour
# ==============================================================================
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# ==============================================================================
# Completion
# ==============================================================================

# Load completion system
autoload -Uz compinit

# Init completion with cache metadata
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# comp style
zstyle ':completion:*' menu select

# comp style with matcher
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ==============================================================================
# Fuzzy finder
# ==============================================================================
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# =========================================================
# Modular Config Files
# =========================================================

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Custom keybindings
source "$ZDOTDIR/bindings.zsh"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"

# python venv loader
source "$ZDOTDIR/python_env.zsh"

# ==============================================================================
# Custom Functions
# ==============================================================================

# Automatically list directory contents upon changing directories
# cd() {
#   builtin cd "$@" && ls
# }

# Dynamic Fastfetch with Matugen Colors
# function fetch() {
   
#     # Run Fastfetch instantly using the cached config
#     fastfetch
# }

# ==============================================================================
# Execute on Startup
# ==============================================================================
# fetch

# Init zoxide
eval "$(zoxide init zsh)"




