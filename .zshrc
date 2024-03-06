#!/bin/bash
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
alias ls='eza --icons --git'
alias cmi-code='code /data/cmi/notes/'
eval "$(zoxide init zsh)"
alias cd='z'
alias cdi='zi'
alias rc='nvim ~/.zshrc'
alias data='cd /data/'
alias nemo='nemo .'
# alias ds='vrun ~/ds'
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

# whole python environment shenanigan

VENV_DIR="/home/rudy/venvs"

function colprint() (
	text="${1#'[#'??????']'}"
	r="${1%"$text"}"
	r="${r%']'}"
	r="${r#'[#'}"
	r="${r:-FFFFFF}"
	b="${r#????}"
	r="${r%??}"
	g="${r#??}"
	r="${r%??}"
	printf '\e[38;2;%d;%d;%dm%s\e[0m\n' "0x$r" "0x$g" "0x$b" "$text"
)

function pycreate() {
	local name=$1
	local requirements=$2
	local venv_path="$VENV_DIR/$name"

	if [[ -d "$venv_path" ]]; then
		message="$(colprint "[#F38BA8]󰀦 Environment $name already exists. Do you want to overwrite it? [y/n] ")"
		read -p "$message" overwrite
		if [[ "$overwrite" != "y" ]]; then
			read -p "Enter a new name for the environment: " name
			create "$name" "$requirements_file"
			return
		else
			rm -rf $venv_path
		fi
	fi

	echo "Creating virtual environment '$name' ..."
	python -m venv "$venv_path"

	if [[ -n "$requirements" ]]; then
		"$venv_path/bin/pip" install -r "$requirements"
	fi
	colprint "[#A6E3A1]󰄬  $name created successfully"
}

function pydelete() {
	local name=$1
	local venv_path="$VENV_DIR/$name"

	if [ ! -d "$venv_path" ]; then
		message="$(colprint "[F38BA8]󰀦 Environment $name does not exist. Do you want to create it? [y/n] ")"
		read -p "$message" create
		if [ "$create" == "y" ]; then
			create "$name"
		else
			echo "Aborted."
			exit 1
		fi
	fi

	rm -rf "${venv_path}"
	colprint "[#A6E3A1]󰄬  $name deleted successfully"
}

function pyactivate() {
	local name=$1
	local venv_path="$VENV_DIR/$name"

	if [ ! -d "$venv_path" ]; then
		message="$(colprint "[F38BA8]󰀦 Environment $name does not exist. Do you want to create it? [y/n] ")"
		read -p "$message" create
		if [ "$create" == "y" ]; then
			create "$name"
		else
			echo "Aborted."
			exit 1
		fi
	fi

	echo "${venv_path}/bin/activate"
	. "${venv_path}/bin/activate" || return $?
	colprint "[#A6E3A1]󰄬  $name activated"
}
