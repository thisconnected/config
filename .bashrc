# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

export BASH_USER_COLOR=224
export BASH_PATH_COLOR=105
export BASH_ROOT_COLOR=9

if [ "$color_prompt" = yes ]; then
    if [ "$EUID" -ne 0 ]; then
	export PS1=`printf "\[\e[38;5;%dm\]\\u@\\h\[\e[00m\]:\[\033[38;5;%dm\]\\w\[\033[00m\]\\$ " $BASH_USER_COLOR $BASH_PATH_COLOR 2>/dev/null`
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;51m\]\u@\h\[\033[00m\]:\[\033[38;5;105m\]\w\[\033[00m\]\$ '
    else
	export PS1=`printf "\[\e[38;5;%dm\]\\u@\\h\[\e[00m\]:\[\033[38;5;%dm\]\\w\[\033[00m\]\\$ " $BASH_ROOT_COLOR $BASH_PATH_COLOR 2>/dev/null`
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;9m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#custom aliases
alias octave='octave --no-gui'
alias objdump='objdump -M intel'

if [ "$EUID" -ne 0 ]; then
    if [ -z $TMUX ]; then
	tmux attach;
	if [ $? -eq 1 ]; then
	    source pkaniews-openrc.sh
	    tmux
	fi
    else
	if [ -f /etc/motd ]; then
	    cat /etc/motd
	fi
    fi
fi
export EDITOR='emacsclient -t'
export SUDO_EDITOR='emacsclient -t'
export VISUAL='emacsclient -t -a emacs'
alias mapvm='nmap -sn 192.168.122.0/24'
alias emacs='emacsclient -c'
export XZ_OPT="--threads=0"

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export QT_QPA_PLATFORMTHEME='gnome'

# default cmake ninja
# export CMAKE_GENERATOR=Ninja
alias git-graph="git log --graph --decorate --oneline"

#serenity
export SERENITY_SOURCE_DIR=/home/thisconnect/serenity

export SERENITY_RAM_SIZE=16G


#temp fix for vte
__vte_prompt_command() { true; }

export PATH=~/.local/bin:$PATH
#bash options
shopt -s autocd
shopt -s cdspell
shopt -s direxpand
shopt -s extglob
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias jenkins-lint="ssh jenkins-cli declarative-linter < ./Jenkinsfile"

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
#systemd aliases
alias sct="sudo systemctl"
alias user="systemctl --user"
_completion_loader  systemctl
complete -F _systemctl sct
#
if [ -f "$HOME/.secrets" ]; then
    . "$HOME/.secrets"
fi

scripting()
{
    cd $HOME/scripting
    source venv/bin/activate
    export PYTHONPATH=/home/thisconnect/scripting/common
    echo echo PYTHONPATH=$PYTHONPATH
}

microservices()
{
    cd $HOME/microservices
    source venv/bin/activate
    export PYTHONPATH=/var/www/enhancement-microservices/enhancement-ms/app/common
    echo echo PYTHONPATH=$PYTHONPATH
}
if [ -f "/usr/bin/boundary" ]; then
    complete -C /usr/bin/boundary boundary
fi

MANGOHUD_CONFIGFILE=$HOME/MangoHud/MangoHud.conf

export NVM_DIR="/home/thisconnect/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

colors()
{
    for i in {0..255}; do printf '\e[38;5;%dm%3d ' $i $i; (((i+3) % 18)) || printf '\e[0m\n'; done
}


ssh() {
  #https://gist.github.com/nevesnunes/951f77085116a9beea62c9610dda31e8
  # grep -w: match command names such as "tmux-2.1" or "tmux: server"
    if ps -p $$ -o ppid= \
    | xargs -i ps -p {} -o comm= \
    | grep -qw tmux; then
    # Note: Options without parameter were hardcoded,
    # in order to distinguish an option's parameter from the destination.
    #
    #                   s/[[:space:]]*\(\( | spaces before options
    #     \(-[46AaCfGgKkMNnqsTtVvXxYy]\)\| | option without parameter
    #                     \(-[^[:space:]]* | option
    # \([[:space:]]\+[^[:space:]]*\)\?\)\) | parameter
    #                      [[:space:]]*\)* | spaces between options
    #                        [[:space:]]\+ | spaces before destination
    #                \([^-][^[:space:]]*\) | destination
    #                                   .* | command
    #                                 /\6/ | replace with destination
	# tmux set-window-option window-status-current-style bg=white
	# tmux set-window-option window-status-current-style fg=black
	tmux rename-window "ssh@$(echo "$@" \
        | sed 's/[[:space:]]*\(\(\(-[46AaCfGgKkMNnqsTtVvXxYy]\)\|\(-[^[:space:]]*\([[:space:]]\+[^[:space:]]*\)\?\)\)[[:space:]]*\)*[[:space:]]\+\([^-][^[:space:]]*\).*/\6/' | sed 's/enhancement-//g' | sed 's/nesc-//g' )"
	# fix handling those characters
	command ssh "$@"
	tmux set-window-option automatic-rename "on" 1> /dev/null
	# tmux set-window-option window-status-current-style bg=black
	# tmux set-window-option window-status-current-style fg=white
    else
	command ssh "$@"
    fi
}
