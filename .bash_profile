[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
( which hub > /dev/null ) && $(hub alias -s bash)

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# niceties
alias hosts="sudo nano /etc/hosts"
alias vhosts="sudo nano /etc/apache2/extra/httpd-vhosts.conf"
alias simulator="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"
alias mou="open -a Mou"

alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias go="git checkout"
alias gpull="git pull"
alias gpush="git push"
alias be="bundle exec"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Colours
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

PS1="$bldcyn\W $bldpur\$(parse_git_branch): $textrst"

# Prompt
function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="${LIGHT_RED}+"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo ":${branch}${remote}${state}"
  fi
}

function prompt_func() {
    previous_return_value=$?;
    if [ "$TERM" != "linux" -a -z "$EMACS" ]; then
        TITLEBAR="\[\e]2;\u@\h:\w\a\]"
    else
        TITLEBAR=""
    fi
    HOST=""
    if [ "$SSH_CONNECTION" ]; then
        HOST="${GREEN}\h:"
    fi
    prompt="${TITLEBAR}${BLUE}[${HOST}${RED}\w${YELLOW}$(parse_git_branch)${BLUE}]${COLOR_NONE}"
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}${GREEN}\\\$${COLOR_NONE} "
    else
        PS1="${prompt}${LIGHT_RED}\\\$${COLOR_NONE} "
    fi
}

PROMPT_COMMAND=prompt_func

rails_version() {
  which rails >/dev/null && rails -v 2>/dev/null | sed 's/Rails //'
}

r() {
  local name="$1"
  shift
  if [[ -z "$name" ]]; then
    echo "Usage: $0 command *args" >&2
    return 1
  fi
  if [[ -x "./script/$name" ]]; then
    ./script/$name $@
  elif [[ -x "./script/rails" ]]; then
    ./script/rails "$name" $@
  elif [[ -n "$(rails_version | grep '^3')" ]]; then
    rails "$name" $@
  else
    echo "Please change to the root of your project first." >&2
    return 1
  fi
}

# Time saving shortcuts
alias rs="r server"
alias rc="r console"
alias rp='r plugin'
alias rg='r generate'
alias rd="r dbconsole"
alias rr='touch tmp/restart.txt'
alias rl='tail -f log/*.log'
alias rrl='rr && rl'

alias wl=rl

# Alias to s.
for suffix in s c p g d; do
  alias s$suffix="r$suffix"
done

# Unix, Git, Memcached
alias cls='clear'
alias dir='ls -alF'
alias gitcp='git cherry-pick'
alias gitl='git log --pretty=oneline -3 --color --name-status | cat'
alias gitl25='git log --pretty=oneline -25 --color | cat'
alias gitlf='git log --pretty=full -5 --color --name-status | cat'
alias tree='find . -print | sed -e '\''s;[^/]*/;| - ;g;s; - |; |;g'\'''

# Android SDK
export PATH=$PATH:~/Documents/android-sdks/tools:~/Documents/android-sdks/platform-tools

# Added for local development (node, npm, etc)
export PATH=$HOME/local/bin:$PATH

## Added support for local rubies
export PATH=$HOME/local/ruby/bin:$PATH

export ANDROID_HOME=/usr/local/Cellar/android-sdk/r21.0.1

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
