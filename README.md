# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system if not you can also use the commands i provided to get it installed (Works only for Arch-based Distros) 

### Git

```
sudo pacman -S git
```

### Stow

```
sudo pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone https://github.com/muhammadRamzan4669/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

