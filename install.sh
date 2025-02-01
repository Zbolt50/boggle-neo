#!/usr/bin/zsh
echo "Begin install"
echo "Make sure to install with root due to hyprland being stupid"
#sudo pacman -S alacritty fastfetch mpd ncmpcpp neovim tmux waybar wofi wget stow unzip

if ls /usr/share/fonts/JetBrainsMono* 1> /dev/null 2>&1; then
    echo "Fonts already installed.."
else
    # Download JetBrainsMono and install it
    echo "Fonts not installed- installing" 
    wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
    mkdir temp_zip
    unzip JetBrainsMono*.zip -d temp_zip 
    mv temp_zip/fonts/*.ttf /usr/share/fonts/
    fc-cache -f
    rm -rf temp_zip JetBrainsMono*.zip 
fi

# create symlinks using stow
stow $HOME/boggle-neo/* --adopt
