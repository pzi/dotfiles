alias ga="git add"
alias gf="git fetch"
alias gp="git remote prune origin"
alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias gcm="git commit -m"
alias gcf='git config -l'
alias go="git checkout"
alias gitcp='git cherry-pick'

alias gitl='git log --pretty=oneline -3 --color --name-status | cat'
alias gitl25='git log --pretty=oneline -25 --color | cat'
alias gitlf='git log --pretty=full -5 --color --name-status | cat'

alias gbranches="gf && gp && git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | grep -v -E 'tags|release'"

alias syncwithdev='git rebase origin/develop --committer-date-is-author-date'
alias syncwithmaster='git rebase origin/master --committer-date-is-author-date'
