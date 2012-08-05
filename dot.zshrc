
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

local RED=$'%{\e[31m%}'
local GREEN=$'%{\e[32m%}'
local YELLOW=$'%{\e[33m%}'
local BLUE=$'%{\e[34m%}'
local PURPLE=$'%{\e[35m%}'
local WATER=$'%{\e[36m%}'
local WHITE=$'%{\e[37m%}'
local DEFAULT=$'%{\e[m%}'

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
PROMPT_COLOR="${WATER}"
PROMPT='${DEFAULT}${PROMPT_COLOR}[${DEFAULT}`rprompt-git-current-branch`${PROMPT_COLOR}%~]${prompt_newline}${PROMPT_COLOR}${USER}@$(hostname -s )%(!.#.$)${DEFAULT} '
RPROMPT=""

setopt autopushd auto_menu auto_cd correct auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack extended_glob 
setopt list_types no_beep always_last_prompt cdable_vars sh_word_split 
setopt auto_param_keys ignoreeof inc_append_history

alias ls='ls -G'
alias la='ls -A'
alias ll='ls -Al'
alias grep='grep --color=auto'
alias history='history -E 1'
alias diff="colordiff"
alias vi="vim"
alias now="date \"+%Y-%m-%dT%H:%M:%S\""
alias gdb="gdb -q"
alias yd="youtube-dl --title --ignore-errors"

export EDITOR="/usr/local/bin/vim"
export LESS="-R"

limit coredumpsize 1024000000

export PATH="${HOME}/.local/bin:${PATH}"

#mozc_server_start
export XIM=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export XIM_PROGRAM="ibus-daemon"
export XIM_ARGS="-r --daemonize --xim"

# vim: tabstop=4 shiftwidth=4 expandtab softtabstop=4 filetype=zsh
