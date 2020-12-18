function cdd() {
  cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function j() {
  fname=$(declare -f -F _z)

  [ -n "$fname" ] || source "$DOTFILES_PATH/modules/z/z.sh"

  _z "$1"
}

function ll() {
  fname=$(declare -f -F k)

  [ -n "$fname" ] || source "$DOTFILES_PATH/modules/k/k.sh"

  k "$1"
}

function recent_dirs() {
  # This script depends on pushd. It works better with autopush enabled in ZSH
  escaped_home=$(echo $HOME | sed 's/\//\\\//g')
  selected=$(dirs -p | sort -u | fzf)

  cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

function dots_update() {
 cd "$DOTFILES_PATH" || exit
  git pull
  git submodule init
  git submodule update
  git submodule status

  for submodule in "$DOTFILES_PATH/modules/"*; do git submodule update --init --recursive --remote --merge "$submodule"; done
  echo "[submodules] Updated!"

  brew upgrade fnm
  echo "[fnm] Updated!"

  echo "[dots] Updated!"
}