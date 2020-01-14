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

### ALIASES ###
alias ls="ls -lAG";
alias graph="git log --all --oneline --graph --decorate"
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

##############################################################################
#                              SET VIM AS MANPAGER
##############################################################################
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

##############################################################################
#                              PATH
##############################################################################
PATH+=/usr/local/sbin
PATH+=/Users/jcarpenter/bin
PATH+=/usr/local/bin
PATH+=/usr/local/bin
PATH+=/usr/bin
PATH+=/bin
PATH+=/usr/sbin
PATH+=/sbin
PATH+=/usr/local/share/dotnet

##############################################################################
#                              GLOBALS
##############################################################################
EDITOR='vim'

##############################################################################
#                              FZF
##############################################################################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
if hash fd 2> /dev/null; then
    export FZF_DEFAULT_COMMAND="fd -LHI -t f -E '.{git,svn,DS_Store}'"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd -LHI -t d -E '.{git,svn}'"
fi
