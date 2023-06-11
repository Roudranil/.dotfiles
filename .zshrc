export ZSH="/home/rudy/.oh-my-zsh"
export SPACESHIP_CONFIG="/home/rudy/.config/spaceship/spaceshiprc.zsh"


# Define a variable to hold additional paths
CUSTOM_PATH="/home/rudy/.dotfiles/scripts:\
/home/rudy/.local/bin:\
/home/rudy/.local/share/nvim/mason/bin"

# Append the additional paths to the existing $PATH
export PATH="$PATH:$CUSTOM_PATH"

#ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME = ""
# ZSH_THEME="spaceship-prompt/spaceship"

setopt globdots

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
eval "$(feh --bg-scale ~/.dotfiles/wallpapers/night-city.png)"

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
alias dots='cd ~/.dotfiles'
alias pswd='cat ~/lti-pswd.txt | xclip -selection clipboard'

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


