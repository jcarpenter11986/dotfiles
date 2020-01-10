### PROMPT ###
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

### SET VIM AS MANPAGER ###
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

### PATH ###
PATH+=/usr/local/sbin:/Users/jcarpenter/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet

### GLOBALS ###
EDITOR='vim'
