# bat
alias rcat="$(which cat)"
alias cat="$(which bat)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# direnv
eval "$(direnv hook zsh)"

# fix zsh-autocomplete
bindkey "^[[A" up-line-or-search

setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first
setopt hist_verify

# Laravel
art="php artisan"

# python
uvr="uv run"
uvm="uv run manage.py"