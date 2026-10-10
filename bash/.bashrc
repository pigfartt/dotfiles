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
alias mv='mv -i'
alias battery='~/.local/bin/battery_status.sh'
alias ftecsup='nmcli c up "ftecs-sslvpn" --ask'
alias ftecsdown='nmcli c down "ftecs-sslvpn"'

alias meric-mnt='systemctl --user daemon-reload; systemctl --user enable home-spencer-mnt-meric.mount'
alias meric-mnt-restart='systemctl --user restart home-spencer-mnt-meric.mount'
alias meric-mnt-status='systemctl --user status home-spencer-mnt-meric.mount'

startAndDisown() {
	$1 &
	disown $!
}
alias dis=startAndDisown
alias oracleup='ssh opc@207.211.163.6 -i ~/.ssh/ssh-key-2025-04-30.key'

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export NOTEBOOK_DIR="$HOME/notes"

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" yazi
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

fastfetch




PATH="/home/spencer/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/spencer/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/spencer/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/spencer/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/spencer/perl5"; export PERL_MM_OPT;
