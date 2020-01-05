# Set Dracula colors
reset=$(tput sgr0);

# Git branch function
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Style and set the prompt
export PS1="\u@\h: \W\$(parse_git_branch) \$ ";

# Convenient command aliases
alias ls="ls -lAG";
