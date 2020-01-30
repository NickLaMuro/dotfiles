dotfiles
========

Looks like you have stumbled across the dotfiles repo of Nick LaMuro.  Well,
this is probably a constant work in progress, but you are welcome to take a
look and see if anything is of interest to you.

Feel free to fork, modify or distribute parts or all of what is in this repo.
Most of what is in here is derivative of other dotfiles and such collected over
the years.  I have attempted to credit those that I have taken from, but if you
find something that you wish to have credited, open up a issue and I will take
a look.


Setup
-----

### Linux/Unix

Included is a rough `setup.sh` script that should work on most unix/linux
systems.  It will overwrite any config files/dir found in your home directory
that match the configuration in this repo.  Use at your own risk, but it should
be idempotent so it can be run multiple times over.


### Windows

A setup script doesn't exist for this repo yet (TODO), but the vim
configuration should be compatible with gvim and such.  No plugins vim plugins
included use external scripting languages.


### Fonts

These dotfiles make use of powerline fonts for configuring vim and tmux status
lines, so for them to show up properly, you will need have one of them install.
This repo has a nice collection available with many free to use fonts:

https://github.com/powerline/fonts


Vim
---

I use pathogen for my plugin management, and specifically manage them in this repo
by including them as `git submodules`.


### Adding a new plugin

```console
$ git submodule add [CLONE_URL] .vim/bundles/[REPO_NAME]
```

Where:

- `[CLONE_URL]` is the name of the repo to clone (EX: https://github.com/junkblocker/patchreview-vim)
- `[REPO_NAME]` is the name of the repo in the dir (EX: patchreview-vim)


License
-------

This project is available as open source under the [MIT License][] terms.  That
said, it is strictly a formality, and you are free to do with this as you like.

... though my ego would probably appreciate an small acknowledgement :)


[MIT License]:   https://opensource.org/licenses/MIT
