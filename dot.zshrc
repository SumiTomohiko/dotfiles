
if [ -z "${SSH_AGENT_PID}" ]; then
    exec ssh-agent "${SHELL}"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tom/.zshrc'
zstyle ':completion:*:default' menu select=1

autoload -Uz compinit
compinit
# End of lines added by compinstall

local FG_BLACK=$'%{\e[30m%}'
local FG_RED=$'%{\e[31m%}'
local FG_GREEN=$'%{\e[32m%}'
local FG_BROWN=$'%{\e[33m%}'
local FG_BLUE=$'%{\e[34m%}'
local FG_PURPLE=$'%{\e[35m%}'
local FG_CYAN=$'%{\e[36m%}'
local FG_LGRAY=$'%{\e[37m%}'
local FG_DGRAY=$'%{\e[1;30m%}'
local FG_LRED=$'%{\e[1;31m%}'
local FG_LGREEN=$'%{\e[1;32m%}'
local FG_YELLOW=$'%{\e[1;33m%}'
local FG_LBLUE=$'%{\e[1;34m%}'
local FG_PINK=$'%{\e[1;35m%}'
local FG_LCYAN=$'%{\e[1;36m%}'
local FG_WHITE=$'%{\e[1;37m%}'
local FG_DEFAULT=$'%{\e[m%}'
local BG_RED=$'\e[0;41m'
local BG_GREEN=$'\e[0;42m'
local BG_BROWN=$'\e[0;43m'
local BG_BLUE=$'\e[0;44m'
local BG_PURPLE=$'\e[0;45m'
local BG_CYAN=$'\e[0;46m'
local BG_GRAY=$'\e[0;47m'
local ATTR_NORMAL=$'\e[0m'
local ATTR_BOLD=$'\e[1m'
local ATTR_ITALICS=$'\e[3m'
local ATTR_UNDERL=$'\e[4m'
local ATTR_BLINK=$'\e[5m'
local ATTR_OUTLINE=$'\e[6m'
local ATTR_REVERSE=$'\e[7m'
local ATTR_NONDISP=$'\e[8m'
local ATTR_STRIKE=$'\e[9m'
local ATTR_BOLDOFF=$'\e[22m'
local ATTR_ITALICSOFF=$'\e[23m'
local ATTR_UNDERLOFF=$'\e[24m'
local ATTR_BLINKOFF=$'\e[25m'
local ATTR_REVERSEOFF=$'\e[27m'
local ATTR_STRIKEOFF=$'\e[29m'

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
                return
        fi
        name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=%F{green}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=%F{yellow}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=%B%F{red}
        else
                 color=%F{red}
         fi
              
        echo "$color$name$action%f%b "
}

autoload promptinit
promptinit
PROMPT_COLOR="${FG_LBLUE}"
DIR_COLOR="${FG_YELLOW}"
PROMPT='${DEFAULT}${DIR_COLOR}$(tty) [${DEFAULT}`rprompt-git-current-branch`${DIR_COLOR}%~]${prompt_newline}${PROMPT_COLOR}${USER}@$(hostname -s )%(!.#.$)${FG_DEFAULT} '
RPROMPT=""

setopt autopushd auto_menu auto_cd correct auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack extended_glob 
setopt list_types no_beep always_last_prompt cdable_vars sh_word_split 
setopt auto_param_keys ignoreeof inc_append_history

#mozc_server_start
export XIM=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export XIM_PROGRAM="ibus-daemon"
export XIM_ARGS="-r --daemonize --xim"

export EDITOR="vim"
export LESS="-R"
export MAKEOBJDIR="."

alias ls='ls -G'
alias la='ls -A'
alias ll='ls -Al'
alias grep='grep --color=auto'
alias history='history -E 1'
alias diff="colordiff"
alias vi="${EDITOR}"
alias n="date \"+%Y-%m-%dT%H:%M:%S\""   # now
alias now=n
alias gdb="gdb -q"
alias yd="youtube-dl --title --ignore-errors"

limit coredumpsize 1024000000

# vim: tabstop=4 shiftwidth=4 expandtab softtabstop=4 filetype=zsh
