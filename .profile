# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

#####
## Environment variables
#####
# Neovim
EDITOR=/usr/bin/nvim;       export EDITOR
VISUAL=/bin/nvim;           export VISUAL
VIMCONF="$HOME/.config/vim";export VIMCONF
MYVIMRC="$VIMCONF/vimrc";   export MYVIMRC
VIMINIT="source $MYVIMRC";  export VIMINIT
alias vim='/usr/bin/nvim'
# ProtonTricks
STEAM_RUNTIME=1;            export STEAM_RUNTIME
PROTONTRICKS_GUI='zenity';  export PROTONTRICKS_GUI
umask 022

#####
# Useful aliases
#####
alias update-grub="sudo grub2-mkconfig -o $(readlink /etc/grub2-efi.cfg)"
alias grubup='update-grub'

# Replacing ls with eza
ls_eza='/usr/bin/eza --color=always --group-directories-first'
alias ls="$ls_eza -A"  # show all files
alias la="$ls_eza -Al" # show all files in a list
alias lt="$ls_eza -AT" # show all files in a tree
#alias l.="$ls_eza -Ald" # show off only dotfiles
alias ld="$ls_ez: -lD"  # show off only directories

# Replacing grep with ugrep
u_grep='/usr/bin/ugrep --color=auto'
alias grep="$u_grep"
alias fgrep="$u_grep -F"
alias egrep="$u_grep -E"

# Common use
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='/usr/bin/wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias dir='/usr/bin/dir --color=auto'
alias vdir='/usr/bin/vdir --color=auto'
alias feh="feh --borderless --scale-down --auto-zoom --sort filename \
            --draw-filename --draw-tinted"
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
#alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of git packages
alias ip='/usr/bin/ip -color'

# Download content from YouTube and the like
dlp="yt-dlp \
    --downloader aria2c --downloader-args '-c -j 3 -x 3 -s 3 -k 1M' \
    --windows-filenames"
alias yt-mp3="  $dlp --no-playlist \
    -x --audio-format mp3 \
    --embed-thumbnail --embed-metadata "
alias yt-list=" $dlp --yes-playlist \
    --ignore-errors --continue --no-overwrites \
    --download-archive progress.txt "

# Custom script shorthands
if [ -d $HOME/.scripts ]; then
    alias radio="$HOME/Documents/skripts/radio.sh"
fi



#####
# ArchLinux specific aliases
#####
if ( grep -q 'arch' /etc/os-release ); then
    # Get the fastest mirrors
    reflector="sudo reflector \
                --latest 50 \
                --number 20 \
                --protocol https \
                --save /etc/pacman.d/mirrorlist"
    alias mirror=" $reflector --verbose"
    alias mirrord="$reflector --sort delay"
    alias mirrors="$reflector --sort score"
    alias mirrora="$reflector --sort age"
    # Remove package along with its dependencies
    alias rmpkg="sudo pacman -Rcns"
    # Cleanup orphaned packages
    alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
    # Recently installed packages
    alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

    # Get the error messages from journalctl
    alias jctl="journalctl -p 3 -xb"
fi

