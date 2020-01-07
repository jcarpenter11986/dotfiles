# Git branch function
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Style and set the prompt
#PS1="\[\033[01;36m\]\u@\h";
#PS1+="\[\033[00m\]:";
PS1="\[\033[01;127m\]\w";
PS1+="\[\033[00m\]\[\033[01;35m\]\$(parse_git_branch)"
PS1+=" \[\033[00m\]\$ "
export PS1;

# Convenient command aliases
alias ls="ls -lAG";
alias graph="git log --all --oneline --graph --decorate"
