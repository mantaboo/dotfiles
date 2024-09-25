
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mantaboo/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# Set prompt type
prompt suse
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
setopt HIST_IGNORE_ALL_DUPS
bindkey -e
# End of lines configured by zsh-newuser-install

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# bun completions
[ -s "/home/mantaboo/.bun/_bun" ] && source "/home/mantaboo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Make neovim the default editor
export EDITOR=nvim
export VISUAL=nvim

# My variables

# Suggested for Ranger file manager
export RANGER_LOAD_DEFAULT_RC=false

## Research how to properly set the variables below.
## https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API
# export VDPAU_DRIVER=libvdpau_nvidia.so
# export LIBVA_DRIVER_NAME=nvidia_drv_video.so

# Set keybindings to vi
# set -o vi

# My aliases
# alias sway="sway --unsupported-gpu"
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
alias cat='bat'
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
alias rsync_movies='rsync -raveP --rsh='ssh -p 22122' --progress --remove-sent-files ~/Videos/Movies/* mantaboo@192.168.1.147:/mnt/media/Movies/'
alias rsync_shows='rsync -raveP --rsh='ssh -p 22122' --progress --remove-sent-files ~/Videos/Shows/* mantaboo@192.168.1.147:/mnt/media/Shows/'
alias dotfiles='/usr/bin/git --git-dir="$HOME/git/dotfiles/" --work-tree="$HOME"'
