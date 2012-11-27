Dotfiles
--------

To automatically symlink all dotfiles to your home directory, run the following command from `~/`

```bash
for f in $(ls -Ap ~/Dropbox/Apps/dotfiles/ | grep -v / | grep -v README); do echo "Removing and symlinking $f to ~/Dropbox/Apps/dotfiles/$f"; rm $f; ln -s ~/Dropbox/Apps/dotfiles/$f; done