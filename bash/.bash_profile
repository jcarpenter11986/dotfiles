##############################################################################
#                              PROMPT
##############################################################################
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_status() {
	[git status 2> /dev/null | grep "Your branch is up to date"] && echo "Y"
}

# These colors are only supported by True Color terminals, so if
# you are using terminal.app, these won't work. iTerm2 does, however!

export RED='\[\033[38;2;255;85;85m\]' # Dracula color
export GREEN='\[\033[38;2;80;250;123m\]' # Dracula color
export ORANGE='\[\033[38;2;255;184;108m\]' # Dracula color
export PURPLE='\[\033[38;2;189;147;249m\]' # Dracula color
export PINK='\[\033[38;2;255;121;198m\]' # Dracula color
export CYAN='\[\033[38;2;139;233;253m\]' # Dracula color
export YELLOW='\[\033[38;2;241;250;140m\]' # Dracula color
export DEFAULT='\[\033[0m\]'

export PS1="$CYAN\W$PINK\$(parse_git_branch) $DEFAULT\$ "

# TO DO
# Add a ligature or symbol to the end of prompt to indicate if there are
# modified or untracked changes.

##############################################################################
#                              ALIASES
##############################################################################
alias ls="ls -lAG";
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
EDITOR='vim'
export EDITOR;

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

