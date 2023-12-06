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
# eval "$(feh --bg-scale ~/.dotfiles/wallpapers/futuristic-city-mocha.png)"

alias hx='helix'
alias ls='exa --icons --git'
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
alias update-mirrorlist='sudo reflector --country India --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'


obsidiancreate() {
  if [ -z "$1" ]; then
    echo "Usage: obsidiancreate <path>"
    return 1
  fi

  local obsidian_dir="$HOME/.dotfiles/.obsidian"
  local target_path="$1"

  if [ ! -d "$obsidian_dir" ]; then
    echo "Obsidian directory not found: $obsidian_dir"
    return 1
  fi

  if [ ! -d "$target_path" ]; then
    echo "Target path does not exist: $target_path"
    return 1
  fi

  local symlink_path="${target_path%/}/.obsidian"

  if [ -e "$symlink_path" ]; then
    echo "Symlink already exists: $symlink_path"
    return 1
  fi

  ln -s "$obsidian_dir" "$symlink_path"
  echo "Created symlink: $symlink_path -> $obsidian_dir"
}

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

function compresspdf() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: compress_pdf <input_pdf>"
        return 1
    fi

    local input_file="$1"
    local output_file="${input_file:r}-compressed.pdf"

    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile="$output_file" "$input_file"
}
