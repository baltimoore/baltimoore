#
# ~/.bashrc
#

# For shell-agnostic (but sh compliant) aliases and sysvars
source ~/.profile

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

#####
# Bash configs
#####

# history file settings
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTSIZE=500
shopt -s histappend

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# If this is an xterm, set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]\[\e[1;35m\]\u\[\e[0m\]@\[\e[1;36m\]\H\[\e[0m\]:\[\e[1;32m\]\w\[\e[0m\]\n\[\e[1;32m\]\$ \[\e[0m\]"
    ;;
*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac



#####
# Application imports
#####

# For miniconda
if [ -f /opt/miniconda3/etc/profile.d/conda.sh ]; then
    source /opt/miniconda3/etc/profile.d/conda.sh
fi

# For Spicetify to work proper
if [ -d "$HOME/.spicetify" ]; then
    export PATH="$PATH:$HOME/.spicetify"
fi

# For pyEnv
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init - bash)"
fi
