# Dotfiles

## Get Ready
```Bash
git clone https://github.com/michaelsilver/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## To install my settings:
```Bash
chmod +x ./setup.sh
./setup.sh
```

## To use my framework:
First delete everything other than `addfile.sh` and `setup.sh`. Then add whatever dotefiles from ~ you want GitHub to track using
```
./addfile.sh filename-without-dot-at-beginning
```
Ex: want GitHub to track `~/.emacs`:
```
./addfile.sh emacs
git commit -m "added my dotfiles" emacs && git push
```
And there you go, up on GitHub. Note `addfile` can take any number of filenames, e.g.

```
./addfile.sh emacs bashrc vimrc  # acts on all three
```
To install your dotfiles on another machine, follow the instructions under "To install my settings" only cloning and using your fork of the repo rather than mine.
