ulimit -n 200000
ulimit -u 2048

source $DOTFILES_PATH/terminal/aliases.sh
source $DOTFILES_PATH/terminal/exports.sh
source $DOTFILES_PATH/terminal/functions.sh


# Register all aliases
# for aliasToSource in "$DOTFILES_PATH/terminal/_aliases/"*; do source "$aliasToSource"; done
# Register all exports
# for exportToSource in "$DOTFILES_PATH/terminal/_exports/"*; do source "$exportToSource"; done
# Register all functions
# for functionToSource in "$DOTFILES_PATH/terminal/_functions/"*; do source "$functionToSource"; done