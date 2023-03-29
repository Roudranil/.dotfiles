export ZSH="/home/rudy/.oh-my-zsh"
export SPACESHIP_CONFIG="/home/rudy/.config/spaceship/spaceshiprc.zsh"

#ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME = ""
# ZSH_THEME="spaceship-prompt/spaceship"

source ~/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zoxide  
  pip
  python
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

alias hx='helix'
alias ls='exa --icons'
alias cmi='cd /data/cmi/notes/'
alias cmi-code='code /data/cmi/notes/'
eval "$(zoxide init zsh)"
alias cd='z'
alias cdi='zi'
alias rc='nvim ~/.zshrc'
alias data='cd /data/'
alias ds='vrun ~/ds'

function vid() {
    mpv "$@" &
}

function pdf() {
  zathura "$@" &
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
