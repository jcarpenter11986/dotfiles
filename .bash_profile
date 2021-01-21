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

alias graph="git log --all --oneline --graph --decorate"
alias cp="cp -i"                        # confirm before overwriting something
alias df='df -h'                        # human-readable sizes
alias free='free -m'                    # show sizes in MB
alias ls="ls -G"                        # color output

##############################################################################
#                              ENVARS
##############################################################################

PATH+=:/Users/jcarpenter/bin

##############################################################################
#                              GLOBALS
##############################################################################

export EDITOR='vim'

##############################################################################
#                              COMPLETIONS
##############################################################################

# HOMEBREW
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

# BASH
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
