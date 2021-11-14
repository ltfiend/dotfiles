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
HISTSIZE=10000
HISTFILESIZE=20000

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
alias ll='ls -lhart'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias gcheck='curl https://www.gstatic.com/ipranges/publicdns.json | jq ".prefixes[]  | .ipv4Prefix // .ipv6Prefix "|fzf'
alias awsip='curl https://ip-ranges.amazonaws.com/ip-ranges.json | jq -r ".prefixes[] | select(.service==\"S3\") | .ip_prefix"|fzf'
alias cfip='curl https://api.cloudflare.com/client/v4/ips|jq "[.result.ipv6_cidrs, .result.ipv4_cidrs]"|awk -F"\"" "/\w+/{print $2}"|fzf' 
alias c='cat ~/.commands | fzf --print0'
alias fd=fdfind

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

export PATH=$PATH:/home/peter/.local/bin

# Adjust screen terminal names
vi() { 
  unset PROMPT_COMMAND;
  echo -e '\033kEditing '$1' \033\\'; 
  /usr/bin/vim $1; }
dig() { 
  unset PROMPT_COMMAND;
  echo -e '\033kDIG '$@' \033\\'; 
  /usr/bin/dig $@; 
  }
cd() {
  unset PROMPT_COMMAND;
  builtin cd $@;
  echo -e '\033k'$HOSTNAME':'$PWD' \033\\'; 
}
# btop() { 
#   unset PROMPT_COMMAND;
#   echo -e '\033k-=< BTOP >=-\033\\'; 
#   btop; 
#   }
python() {
  echo -e '\033kExecuting - python '$@'\033\\';
  /usr/bin/python $@;
}
# Set screen name to ssh description, this can be overriden by the remote host
# ssh() { echo -e '\033kSSH to '$@'\033\\'; /usr/bin/ssh $@; }
# reset Prompt Command to original setting
pc() { export PROMPT_COMMAND='printf "\033k%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'; }

# ssh with fzf selecting of ssh/config hosts
s() {
   s=`rg -e 'Host\b' ~/.ssh/config|awk '{print $2}'|fzf`
   ssh $s
}

# dig with fzf completion of .dig_commands entries
d() {
  s=`cat ~/.dig_commands | fzf`
  dig $s
}

# c() {
#   s=`cat ~/.commands | fzf`
# }

export SVN_EDITOR=vim
export EDITOR=vim

stty erase ^?

setxkbmap -config /home/peter/.config/keymap.config
source ~/.fzf_completion.bash
source ~/.fzf_bindings.bash
export FZF_DEFAULT_OPTS="--height 40% --border"
export NODE_OPTIONS=--experimental-worker

alias luamake=/home/peter/Git/lua-language-server/3rd/luamake/luamake
