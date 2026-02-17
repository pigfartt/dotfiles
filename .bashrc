#
#~/.bashrc
#

  eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# alias stuff:
alias battery='~/.local/bin/battery_status.sh'
alias ftecsup='nmcli c up "ftecs-sslvpn" --ask'
alias ftecsdown='nmcli c down "ftecs-sslvpn"'

startAndDisown() {
	$1 &
	disown $!
}
field() {
    awk -F "${2:- }" "{ print \$${1:-1} }"
}
alias dis=startAndDisown
alias oracleup='ssh opc@207.211.163.6 -i ~/.ssh/ssh-key-2025-04-30.key'

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export NOTEBOOK_DIR="$HOME/notes"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" yazi
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

fastfetch
