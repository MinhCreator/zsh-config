# ==============================================================================
# custom variable
# ==============================================================================
alias c="clear"
alias cls="clear"
alias lg="lazygit"
alias clone="git clone"
alias ff="fastfetch"
alias ls="eza -G -F --color=always --icons=always -a"
alias psearch="pacman -Ss"
alias pinstall="sudo pacman -S"
alias prm="sudo pacman -Rns"
alias prmd="sudo pacman -Rdd"
alias ysearch="yay -Ss"
alias yinstall="yay -S"
alias yrm="yay -Rns"
alias yrmd="yay -Rdd"
alias op="opencode"
alias music="music-tui"
alias imgview="qview"
alias imgView="ptui"
alias rmfontcache="fc-cache -fv"
alias git-grab="ghgrab"
# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory


# =========================================================
# Git
# =========================================================

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
