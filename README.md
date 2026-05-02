# dotfiles
my personal dotfiles for linux programs(pkgs)

sudo pacman -S xorg-server libxft libxinerama base-devel xorg-xinit

sudo pacman -S zoxide fzf kitty zsh

chsh -s /usr/bin/zsh $USER

# Essential Setup :
```
mkdir -p "$HOME/.config/"{alacritty,kitty,niri}
```

# top tracker setup:

## dependencies
```sudo pacman -S fuse3 xcb-util-cursor```

```
curl -s https://api.github.com/repos/Alexander-Calderon/TopTracker-Linux-Universal/releases/latest \
| grep "browser_download_url.*AppImage" \
| cut -d '"' -f 4 \
| xargs curl -L -O
```

# Alacritty Themes setup:

```
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```
