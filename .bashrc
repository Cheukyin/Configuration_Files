#
# ~/.bashrc
#

fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias du-files='du -h --max-depth=1'
alias du-single='du -sh'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
goagent=~/google_appengine/goagent/local/proxy.py
alias diff='colordiff'              # requires colordiff package
alias mkdir='mkdir -p -v'
alias free='free -h'
alias ll='ls -l'
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
complete -cf sudo
complete -cf man
alias pacman='sudo pacman'
alias updatedb='sudo updatedb'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias abs='sudo abs'
Songs='/mnt/c/KuGou'
