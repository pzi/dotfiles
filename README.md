Dotfiles
--------

To automatically symlink all dotfiles to your home directory, run the following command from `~/`

```bash
for f in $(ls -Ap ~/Dropbox/Sync/dotfiles/ | grep -v / | grep -v README | grep -v .DS_Store); do echo "Removing and symlinking $f to ~/Dropbox/Sync/dotfiles/$f"; rm $f; ln -s ~/Dropbox/Sync/dotfiles/$f; done
```

Also change username in `.rvmrc` to resemble current user.

Finally, get Sublime Text 2 to launch from the CLI by running:
```bash
ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```

In case you use Sublime Text 3, do the below:
```bash
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```
