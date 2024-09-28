#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
# ~/.bashrc
eval "$(starship init bash)"

# Make neovim the default editor
export EDITOR=nvim
export VISUAL=nvim

# Set keybindings to vi
# set -o vi

# My aliases
alias sway="sway --unsupported-gpu"
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}
# alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
# alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
alias cat='bat --color=always'
alias mirupd="sudo reflector --save /etc/pacman.d/mirrorlist -c US -p https -l 10"
alias ssh="kitty +kitten ssh"
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'
alias ls='lsd --group-directories-first'
alias l='lsd -l --group-directories-first'
alias la='lsd -a --group-directories-first'
alias lla='lsd -la --group-directories-first'
alias lt='lsd --tree --group-directories-first'
# alias scup='wakeonlan -p 9 -i 192.168.1.147 00:25:22:e0:ab:7d'
alias scup='wol  00:25:22:e0:ab:7d'
alias scssh='ssh -p 22122 mantaboo@192.168.1.147'
alias rsync_movies='rsync -raveP --rsh="ssh -p 22122" --progress --remove-sent-files ~/Videos/Movies/* mantaboo@192.168.1.147:/mnt/media/Movies/'
alias rsync_shows='rsync -raveP --rsh="ssh -p 22122" --progress --remove-sent-files ~/Videos/Shows/* mantaboo@192.168.1.147:/mnt/media/Shows/'
alias dotfiles='/usr/bin/git --git-dir="$HOME/git/dotfiles/" --work-tree="$HOME"'
