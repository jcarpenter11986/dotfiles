##############################################################################
#                              CURRENT SYSTEM CHECK
##############################################################################

current_system=$(uname)

##############################################################################
#                              PROMPT
##############################################################################

export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes
PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '

##############################################################################
#                              ALIASES
##############################################################################

case $current_system in
    'Darwin'*)
        alias ls="ls -lAG"
        ;;
    'Linux'*)
        alias ls="ls --color=auto"
        ;;
    esac
        
alias graph="git log --all --oneline --graph --decorate"
alias cp="cp -i"                        # confirm before overwriting something
alias df='df -h'                        # human-readable sizes
alias free='free -m'                    # show sizes in MB
alias t="todo.sh -A -n"
alias grep="grep --color=auto"

##############################################################################
#                              ENVARS
##############################################################################

PATH+=:/Users/jcarpenter/bin
PATH+=:/Library/Frameworks/Python.framework/Versions/3.8/bin

[ -f ~/.KEY_VALUE ] && source ~/.KEY_VALUE

##############################################################################
#                              GLOBALS
##############################################################################

export EDITOR='vim'

##############################################################################
#                              HOMEBREW COMPLETIONS
##############################################################################

if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

