##############################################################################
#                              PROMPT
##############################################################################
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\[\033[01;127m\]\w";
PS1+="\[\033[00m\]\[\033[01;35m\]\$(parse_git_branch)"
PS1+=" \[\033[00m\]\$ "
export PS1;

# TO DO
# add git status to prompt so that you know if your branch is no longer the
# same as remote.

##############################################################################
#                              ALIASES
##############################################################################
alias ls="ls -lAG";
alias graph="git log --all --oneline --graph --decorate"
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

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

##############################################################################
#                              FZF
##############################################################################
if hash fd 2> /dev/null; then
    export FZF_DEFAULT_COMMAND="fd -LHI -t f -E '.{git,svn,DS_Store}'"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd -LHI -t d -E '.{git,svn}'"
fi

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash