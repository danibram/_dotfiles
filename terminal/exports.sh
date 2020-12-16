#######
# PATHs
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="$(/usr/libexec/java_home)"
export CODE_TSJS=1
export DENO_INSTALL="/Users/dbr/.deno"

paths=(
  "$HOME/bin"
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "node_modules/.bin"
  "/bin"
  "/usr/local/bin" # This contains Brew ZSH. If it's below `/bin` it won't be executed.
  "/usr/local/opt/make/libexec/gnubin"
  "/usr/bin"
  "/usr/local/sbin"
  "/usr/sbin"
  "/sbin"
  "$ANDROID_HOME/emulator"
  "$ANDROID_HOME/tools"
  "$ANDROID_HOME/tools/bin"
  "$ANDROID_HOME/platform-tools"
  "$DENO_INSTALL/bin"
  "/usr/local/opt/icu4c/bin"
  "/usr/local/opt/icu4c/sbin"
  "/Users/dbr/.fnm"
  "$HOME/.zsh/bin"
)

PATH=$(
  IFS=":"
  echo "${paths[*]}"
)

export PATH

#########
# opam configuration
test -r /Users/dbr/.opam/opam-init/init.zsh && . /Users/dbr/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

eval "$(fnm env)"
