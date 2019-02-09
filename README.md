# Dotfiles
![Alt text](/img/terminal.png?raw=true "Terminal Screenshot")

## Get Ready
```Bash
git clone https://github.com/michaelsilver/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## To install my settings:
Regardless of what dotfiles you choose to install, your old versions will be automatically moved to `~/dotfiles-old`

To install all my dotfiles:
```Bash
chmod +x ./setup.sh
./setup.sh
```

To install select dotfiles:
```
./setup.sh <dotfile1> <dotfile2> <...>
```
Ex: want to install emacs & bashrc?
```
./setup.sh emacs bashrc
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

## Add-ons
To install Git-Autocomplete:
```Bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
```
If you later encounter an error like: 
```
Unknown option: --list-cmds=list-mainporcelain,others,nohelpers,alias,list-complete,config
usage: git [--version] [--help] [-C <path>] [-c name=value]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]
```
Then you probably have an older version of git installed. Remove the `~/.git-completion.bash` file and download an older version of Git-Autocomplete:
```Bash
rm ~/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/v2.17.1/contrib/completion/git-completion.bash -o ~/.git-completion.bash
```

To intall extention to show the current Git Branch:
```Bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
```
My `.bashrc` automatically sees these files, and upon refresh of the prompt, you can begin enjoying these features. Cudos to Code Worrier for the instructions ([autocompletion](http://code-worrier.com/blog/autocomplete-git/)) ([git branch](http://code-worrier.com/blog/git-branch-in-bash-prompt/)).

## Credits
Install script roughly based on this [tutorial](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/). `bashrc` based on [Amit Bansil's](https://github.com/amit-bansil).

Also, thank you to [Geoff Greer](https://github.com/ggreer) for his useful [LSCOLORS Generator](http://geoff.greer.fm/lscolors/).
