# Dylan's .bashrc

# Set the prompt.
# $USER ~/path/to/dir >
export PS1
# PS1="$USER \w \[$(tput setaf 5)\]>\[$(tput sgr0)\]"
PS1="\w \[$(tput setaf 6)\]><((('> \[$(tput sgr0)\]"

# Set nvim as editor.
export EDITOR="nvim"

# Add ~/bin to path
PATH="${PATH}:${HOME}/bin"
PATH="${HOME}/.gem/ruby/2.4.0/bin:${PATH}"

# Set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="${HOME}/.config"

# Fix CSGO mouse issues
export SDL_VIDEO_X11_DGAMOUSE=0

# Make steam not close to tray.
export STEAM_FRAME_FORCE_CLOSE=0

# Fix smooth scroll in Firefox.
export MOZ_USE_OMTC=1

# Source colors generated by wal.
source "${HOME}/.cache/wal/colors.sh"

# History completion.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Don't log duplicate commands.
export HISTCONTROL=ignoredups

# Check window size after every command.
shopt -s checkwinsize

# ALIASES

alias steam="steam-native"
alias sxiv="sxiv -b -s f"
alias handbrake="ghb"

# Auto start X.
[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx -- vt1 &> /dev/null

# Import colorscheme from 'wal'
if [[ "$VTE_VERSION" ]]; then
    :
    # (~/projects/wal/wal -rt &)
else
    (~/projects/wal/wal -r &)
fi

brightness() {
    sudo tee /sys/class/backlight/intel_backlight/brightness <<< "${1:-937}"
}

[[ -f "${HOME}/.fzf.bash" ]] && source "${HOME}/.fzf.bash"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PATH="/usr/games/:${PATH}"
