# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

autoload -U compinit
#completion for yaourt
fpath=(/home/cheukyin/.oh-my-zsh/zsh-completions/src/ $fpath)
compinit

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fade"

#autoload -U promptinit
#promptinit
#prompt fade

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
#source $ZSH/inc_complete.zsh

#completion menu
zstyle ':completion:*' menu select
#completion for aliased command
setopt completealiases

#hash the table
rehash
################ Customize to your needs...##################################################################

#GNU Colors needs /etc/DIR_COLORS
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
#Use colors in completion(LS_COLOR)
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
#cowsay&fortune
cowsay -f /usr/share/cows/daemon.cow $(fortune)

alias dd='sudo dd'
alias du-files='du -h --max-depth=1'
alias du-single='du -sh'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias diff='colordiff'              # requires colordiff package
alias mkdir='mkdir -p -v'
alias free='free -h'
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -al'
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias pacman='sudo pacman --color auto'
alias yaourt='sudo yaourt'
alias updatedb='sudo updatedb'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias abs='sudo abs'

alias gcc='gcc -Wall'
alias dstat='dstat -cdlmnpsy'

alias dmi-memory='sudo dmidecode -t memory'
alias dmi-processor='sudo dmidecode -t processor'
alias dmi-bios='sudo dmidecode -t bios'

alias ftp-start='sudo systemctl start vsftpd'

alias vbox-debian='vboxheadless -startvm "debian" &'
alias vbox-xp='vboxheadless -startvm "XP" &'
alias xp='rdesktop 192.168.57.1:3390 &'
alias debian='rdesktop 192.168.56.1:3389 &'
alias shutdown-xp='VBoxManage controlvm XP poweroff'
alias shutdown-debian='VBoxManage controlvm debian poweroff'

alias reboot-fast='sudo systemctl kexec'
alias grep='grep --color=auto -n'

alias hash='hash -r'

alias mount='sudo mount --options=utf8 --rw'
alias mount-sdb='mount /dev/sdb /mnt/usb1'
alias mount-sdc='mount /dev/sdc /mnt/usb2'

alias umount='sudo umount'
alias umount-sdb='umount /dev/sdb'
alias umount-sdc='umount /dev/sdc'

alias fdisk='sudo fdisk'
alias chmod='sudo chmod'
alias chown='sudo chown'
alias chgrp='sudo chgrp'

alias visudo='sudo visudo'

alias pcmanfm='dbus-launch pcmanfm'

alias modprobe='sudo modprobe'
alias insmod='sudo insmod'
alias rmmod='sudo rmmod'

alias hddtemp='sudo hddtemp'

alias x11vnc-start='x11vnc -forever -passwd cheukyin'

source /usr/share/doc/pkgfile/command-not-found.zsh

#up-line-or-search-prefix () {
#    local CURSOR_before_search=$CURSOR
#    zle up-line-or-search "$LBUFFER"
#    CURSOR=$CURSOR_before_search
#}
#zle -N up-line-or-search-prefix
#bindkey '^[[A' up-line-or-search-prefix
#
#down-line-or-search-prefix () {
#    local CURSOR_before_search=$CURSOR
#    zle down-line-or-search "$LBUFFER"
#    CURSOR=$CURSOR_before_search
#}
#zle -N down-line-or-search-prefix
#bindkey '^[[B' down-line-or-search-prefix

up-line-or-history-beginning-search () {
    if [[ -n $PREBUFFER ]]; then
        zle up-line-or-history
    else
        zle history-beginning-search-backward
    fi
}
zle -N up-line-or-history-beginning-search
bindkey '^[[A' up-line-or-history-beginning-search

down-line-or-history-beginning-search () {
    if [[ -n $PREBUFFER ]]; then
        zle down-line-or-history
    else
        zle history-beginning-search-forward
    fi
}
zle -N down-line-or-history-beginning-search
bindkey '^[[B' down-line-or-history-beginning-search


# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID :D
#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*' force-list always

# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# useful for path editing — backward-delete-word, but with / as additional delimiter
backward-delete-to-slash () {
    local WORDCHARS='*?_-[]~=&;!#$%^(){}<>.'
    zle .backward-delete-word
}
zle -N backward-delete-to-slash
bindkey '^w' backward-delete-to-slash

#PARAMETER
export EDITOR="vim"
export BROWSER="w3m"
export OFFICE="libreoffice"
export IMAGEVIEWER="mirage"
export VIDEOPLAYER="smplayer"
export PDFVIEWER="evince"
export PYTHONSTARTUP=~/.pythonstartup.py

#related program with file
alias -s png=$IMAGEVIEWER
alias -s jpeg=$IMAGEVIEWER
alias -s jpg=$IMAGEVIEWER
alias -s JPG=$IMAGEVIEWER
alias -s gif=$IMAGEVIEWER
alias -s bmp=$IMAGEVIEWER

alias -s html=$BROWSER
alias -s htm=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER

alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR
alias -s c=$EDITOR
alias -s cpp=$EDITOR
alias -s vhd=$EDITOR
alias -s v=$EDITOR

alias -s pdf=$PDFVIEWER

alias -s doc=$OFFICE
alias -s ppt=$OFFICE
alias -s docx=$OFFICE
alias -s pptx=$OFFICE
alias -s xml=$OFFICE
alias -s odt=$OFFICE

alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s rar='unrar e'
alias -s zip='unzip'

alias -s rm=$VIDEOPLAYER
alias -s rmvb=$VIDEOPLAYER
alias -s avi=$VIDEOPLAYER
alias -s mkv=$VIDEOPLAYER

alias -s lisp='screen vim'

alias -s log='less'
