# Knut’s dotfiles
### A note about this repository

This dofiles repository is just for my own amusement. I make it, I break it and I fix it when I have the time and need. If you find anything interesting you can copy it, or clone the repository wherever you want. (I like to keep it in `~/dotfiles`) The dotbootstrap.sh script will pull in the latest version and copy the files to your home folder.

If you want a better starting point you should surf by one of the sited persons in the Thank you section. Their dotfile repositories are probably fare superior, and better documented, to mine.


## Installation

### Using Git and the bootstrap script

```bash
git clone https://github.com/ksflock/dotfiles.git && cd dotfiles && source dotbootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source dotbootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/ksflock/dotfiles/tarball/master | tar -xzv --strip-components 1
```

To update later on, just run that command again.


## Feedback

Suggestions/improvements
[welcome](https://github.com/ksflock/dotfiles/issues)!

## Author

Knut Flock( ksflack@yohaa.cam ) Swap o's and a's.

## Thanks to…


* [Mathias Bynens]I used his README.md as a template. he allso maintains a nice dofile repository if you need a starting point. [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
