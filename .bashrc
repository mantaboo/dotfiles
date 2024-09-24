#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Make neovim the default editor
export EDITOR=nvim
export VISUAL=nvim

# Set keybindings to vi
# set -o vi

# My aliases
alias mirupd="sudo reflector --save /etc/pacman.d/mirrorlist -c US -p https -l 10"
# alias ssh="kitty +kitten ssh"
alias sudo="sudo "
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
# alias ls="lsd --group-directories-first"
# alias ll="lsd -l --group-directories-first"
# alias la="lsd -a --group-directories-first"
# alias lla="lsd -la --group-directories-first"
# alias lt="lsd --tree"
# alias scup="wakeonlan -p 9 -i 192.168.1.147 00:25:22:e0:ab:7d"
alias scup="wol 00:25:22:e0:ab:7d"
alias scssh="ssh -p 22122 mantaboo@192.168.1.147"
