#!/usr/bin/env zsh
#
# Symlinks files in this directory into $HOME directory

zmodload zsh/stat

# Base dir as path relative to $HOME directory
DIR="${0:a:h}"

function msg() {
	case "$1" in
		ERROR) print -Pn '%F{red}' ;;
		SKIP) print -Pn '%F{yellow}' ;;
		OK) print -Pn '%F{green}' ;;
	esac

	[[ -n "$2" ]] && print -n "[$1: $2]" || print -n "[$1]"
	print -P %f
}


# Files to be symlinked to home directory
local -A dotfiles
dotfiles=(
	bin                    ".zsh/bin"
	modules/zimfw          ".zsh/zim"
	terminal/zshrc         ".zshrc"
	terminal/zshenv        ".zshenv"
	terminal/zlogin        ".zlogin"
	terminal/zimrc         ".zimrc"
	tmux.conf              ".tmux.conf"
	git/gitconfig          ".gitconfig"
	git/gitignore_global   ".gitignore_global"
)

local error symlink
local file srcfile destfile

for file (${(ko)dotfiles}); do
	echo -n "symlinking $file... "

	srcfile="$DIR/$file"
	destfile="$HOME/${dotfiles[$file]}"

	if [[ -h "$destfile" ]]; then
		symlink="$(zstat +link "$destfile")"
		if [[ "$symlink" == "$srcfile" ]]; then
			msg SKIP "file already symlinked"
			continue
		else
			echo -n "(old@ -> $symlink)"
		fi
	fi

	mkdir -p "${destfile:h}"
	if error="$(ln -nsf "$srcfile" "$destfile" 2>&1)"; then
		msg OK
	elif [[ -f "$destfile" ]]; then
		msg ERROR "destination already exists (file)"
	elif [[ -d "$destfile" ]]; then
		msg ERROR "destination already exists (dir)"
	else
		msg ERROR "$error"
	fi
done

mkdir ~/.z
source modules/zimfw/zimfw.zsh install

# Add sourcing of .zshenv to .profile
grep -q "\. \"\$HOME/${dotfiles[zshenv]}\"" ~/.profile || {
	cat >> ~/.profile <<-EOF
		# load posix-compatible .zshenv
		if [ -r "\$HOME/${dotfiles[zshenv]}" ]; then
		    . "\$HOME/${dotfiles[zshenv]}"
		fi
	EOF
}