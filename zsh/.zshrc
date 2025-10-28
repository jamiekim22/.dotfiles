# --------------------------------
# Package specific
# --------------------------------
# FZF: key bindings and fuzzy completion
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
# fzf default for tmux
export FZF_TMUX_OPTS=" -p90%,70% "
# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons=always {} | head -200'"

# Starship 
bindkey -v
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"
# ---------------------------------
# Alias
# ---------------------------------
alias vim="nvim"

# eza (Modernized 'ls' command)
# options: --no-filesize --no-time --no-permissions
# --long for list, --grid for grid view of files
alias ls="eza --no-filesize --grid --color=always --icons=always --no-user"

# fzf
alias f="fzf"
# Open documentation through fzf (e.g., git, zsh, etc.)
alias fman="compgen -c | fzf | xargs man"

# zoxide
# alias cd="z"
# ---------------------------------
# Brew installations activation
# ---------------------------------
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
