# dotfiles
my personal dotfiles for linux programs(pkgs)

sudo pacman -S xorg-server libxft libxinerama base-devel xorg-xinit

sudo pacman -S zoxide fzf kitty zsh

chsh -s /usr/bin/zsh $USER

#top tracker setup:

## dependencies
```sudo pacman -S fuse3 xcb-util-cursor```

```curl -s https://api.github.com/repos/Alexander-Calderon/TopTracker-Linux-Universal/releases/latest \
| grep "browser_download_url.*AppImage" \
| cut -d '"' -f 4 \
| xargs curl -L -O```

