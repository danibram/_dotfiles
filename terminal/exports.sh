#######
# PATHs
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="$(/usr/libexec/java_home)"
export CODE_TSJS=1
export DENO_INSTALL="$HOME/.deno"

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
  "$HOME/.fnm"
  "$HOME/.zsh/bin"
)

PATH=$(
  IFS=":"
  echo "${paths[*]}"
)

export PATH

#########
# opam configuration
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#########
# fnm (NodeJs Version Manager)
eval "$(fnm env)"

#########
# gcloud configuration
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.gcloud/path.zsh.inc" ]; then . "$HOME/.gcloud/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.gcloud/completion.zsh.inc" ]; then . "$HOME/.gcloud/completion.zsh.inc"; fi
