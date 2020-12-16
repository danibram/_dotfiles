#!/usr/bin/env zsh

DIRTY="✗"
NONE="✓"

prompt_dbr_pwd() {
    echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}
}

prompt_dbr_git() {
  [[ -n ${git_info} ]] && print -n "%F{white}[${(e)git_info[prompt]}%F{white}]"
}

prompt_dbr_precmd() {
  (( ${+functions[git-info]} )) && git-info
}

prompt_dbr_setup() {
  local prompt_dbr_status=''

  autoload -Uz add-zsh-hook && add-zsh-hook precmd prompt_dbr_precmd

  setopt nopromptbang prompt{cr,percent,sp,subst}

  zstyle ':zim:git-info:branch' format '%F{cyan}%b'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:clean' format '%F{green}$NONE'
  zstyle ':zim:git-info:dirty' format '%F{yellow}$DIRTY'
  zstyle ':zim:git-info:keys' format 'prompt' '%F{cyan}%b%c %C%D'

  PS1='🐈🐈 $(prompt_dbr_pwd)$(prompt_dbr_git) %(?:%F{green}❯:%F{red}❯) %f'
  RPS1='%F{yellow}[%D{%L:%M:%S}]%F{white}'
}

# ------------------------------------------------------------------------------
# ENTRY POINT
# An entry point of prompt
# ------------------------------------------------------------------------------

# Pass all arguments to the spaceship_setup function
prompt_dbr_setup "$@"