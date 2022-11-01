# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
set -o vi

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
    foot) export TERM=xterm-256color; color_prompt=yes;;
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
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

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
# alias ll='ls -lhart'
alias la='ls -A'
alias l='exa -alhg --icons'
alias ll='exa -alhg -s new --icons'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias gcheck='curl https://www.gstatic.com/ipranges/publicdns.json | jq ".prefixes[]  | .ipv4Prefix // .ipv6Prefix "|fzf'
# alias awsip='curl https://ip-ranges.amazonaws.com/ip-ranges.json | jq -r ".prefixes[] | select(.service==\"S3\") | .ip_prefix"|fzf'
alias awsip='curl https://ip-ranges.amazonaws.com/ip-ranges.json | jq -jr ".prefixes[] | .ip_prefix, \" - \", .region, \"\n\""|fzf'
alias cfip='curl https://api.cloudflare.com/client/v4/ips|jq "[.result.ipv6_cidrs, .result.ipv4_cidrs]"|awk -F"\"" "/\w+/{print $2}"|fzf' 
alias c='cat ~/.commands | fzf --print0'
alias fd=fdfind
alias f='fdfind -I|fzf'
# alias df='duf --hide loops,special'
alias rs='source ~/Git/trueline/trueline.sh'

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

# bloop completions
# . $HOME/.bloop/bash/bloop

export PATH=$PATH:/home/peter/.local/bin

# Adjust screen terminal names
# vi() { 
#   unset PROMPT_COMMAND;
#   echo -e '\033kEditing '$1' \033\\'; 
#   /usr/bin/vim $1; }
# dig() { 
#   unset PROMPT_COMMAND;
#   echo -e '\033kDIG '$@' \033\\'; 
#   /usr/bin/dig $@; 
#   }
# # cd() {
# #   unset PROMPT_COMMAND;
# #   builtin cd $@;
# #   echo -e '\033k'$HOSTNAME':'$PWD' \033\\'; 
# # }
# # btop() { 
# #   unset PROMPT_COMMAND;
# #   echo -e '\033k-=< BTOP >=-\033\\'; 
# #   btop; 
# #   }
# python() {
#   echo -e '\033kExecuting - python '$@'\033\\';
#   /usr/bin/python $@;
# }
# # Set screen name to ssh description, this can be overriden by the remote host
# # ssh() { echo -e '\033kSSH to '$@'\033\\'; /usr/bin/ssh $@; }
# # reset Prompt Command to original setting
# pc() { export PROMPT_COMMAND='printf "\033k%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'; }

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

p() {
  s=`cat ~/.ping_hosts | fzf`
  ping $s
}

# c() {
#   s=`cat ~/.commands | fzf`
# }

export SVN_EDITOR=vim
export EDITOR=vim

stty erase ^?

set keymap vi
setxkbmap -config /home/peter/.config/keymap.config
source ~/.fzf_completion.bash
source ~/.fzf_bindings.bash
export FZF_DEFAULT_OPTS="--height 40% --border"
export NODE_OPTIONS=--experimental-worker

alias luamake=/home/peter/Git/lua-language-server/3rd/luamake/luamake
export PATH="$PATH:/home/peter/.local/share/coursier/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


##### Pureline ####### 

# source ~/Git/pureline/pureline ~/.pureline.conf

##### Trueline ####### 

declare -A TRUELINE_COLORS=(
    [black]='36;39;46'
    [cursor_grey]='40;44;52'
    [green]='152;195;121'
    [grey]='171;178;191'
    [light_blue]='69;133;136'
    [mono]='130;137;151'
    [orange]='214;93;14'
    [purple]='198;120;221'
    [red]='204;36;29'
    [special_grey]='59;64;72'
    [white]='208;208;208'
    [lime]='104;157;106'
    [light_grey]='138;138;138'
    [yellow]='250;189;47'
)

declare -a TRUELINE_SEGMENTS=(
    'aws_profile,light_blue,black,normal'
    'user,black,yellow,normal'
    # 'working_dir,light_blue,black,normal'
    'working_dir,black,light_blue,normal'
    'git,black,orange,normal'
    'time,black,light_grey,normal'
    'exit_status,black,red,bold'
    'newline,black,orange,bold'
    'bg_jobs,black,green,bold'
)

declare -A TRUELINE_SYMBOLS=(
    [git_modified]='*'
    [git_github]=''
    # [segment_separator]=''
    #[segment_separator]='❯'
    [working_dir_folder]='...'
    [working_dir_separator]='/'
    [working_dir_home]='~'
    [newline]=' $ '
    # [newline]='❯'
    [clock]='🕒'
)

TRUELINE_GIT_SHOW_STATUS_NUMBERS=true
TRUELINE_GIT_MODIFIED_COLOR='black'
TRUELINE_WORKING_DIR_SPACE_BETWEEN_PATH_SEPARATOR=false
TRUELINE_SHOW_VIMODE=true
TRUELINE_VIMODE_INS_COLORS_STYLE=('black' 'light_blue' 'bold')
TRUELINE_VIMODE_CMD_COLORS_STYLE=('black' 'green' 'bold')
TRUELINE_VIMODE_INS_CURSOR='vert'
TRUELINE_VIMODE_CMD_CURSOR='block'
TRUELINE_USER_ALWAYS_SHOW_HOSTNAME=true
TRUELINE_USER_SHORTEN_HOSTNAME=false

_trueline_time_segment() {
    local prompt_time="${TRUELINE_SYMBOLS[clock]} \t"
    if [[ -n "$prompt_time" ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " $prompt_time ")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

source ~/Git/trueline/trueline.sh

