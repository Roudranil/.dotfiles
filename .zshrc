export ZSH="/home/rudy/.oh-my-zsh"
export SPACESHIP_CONFIG="/home/rudy/.config/spaceship/spaceshiprc.zsh"

export PATH=$PATH:"/home/rudy/.local/bin"

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
eval "$(feh --bg-scale ~/.dotfiles/wallpapers/futuristic-city-2.jpg)"

alias hx='helix'
alias ls='exa --icons'
alias cmi-code='code /data/cmi/notes/'
eval "$(zoxide init zsh)"
alias cd='z'
alias cdi='zi'
alias rc='nvim ~/.zshrc'
alias data='cd /data/'
alias nemo='nemo .'
alias ds='vrun ~/ds'

function vid() {
    mpv "$@" &
}

function pdf() {
  zathura "$@" &
}

function writer() {
    lowriter "$@" &
}

function impress() {
    loimpress "$@" &
}

function pen() {
  xournalpp "$@" &
}
