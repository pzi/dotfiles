# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,aliases,bash_prompt,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder iTunes Spotify SystemUIServer iTerm Tweetbot" killall





# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
( which hub > /dev/null ) && $(hub alias -s bash)

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Android SDK
export PATH=$PATH:~/Documents/android-sdks/tools:~/Documents/android-sdks/platform-tools
export ANDROID_HOME=/usr/local/Cellar/android-sdk/r21.0.1

# Added for local development (node, npm, etc)
export PATH=$HOME/local/bin:$PATH

## Added support for local rubies
export PATH=$HOME/local/ruby/bin:$PATH

# This loads NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
