#!/bin/fish

set current (pwd)
set seperator "========================"

sudo pacman -Syu
sudo pacman -S xorg-server
echo $seperator
while true
    echo -e "1) xf86-video-intel \n2) xf86-video-amdgpu \n3)Optimus-manager(intel) \n4)None"
    read -l -P "Please enter value for video driver (default 1):" value
    switch $value
        case '' 1
            sudo pacman -S xf86-video-intel
            break
        case 2
            sudo pacman -S xf86-video-amdgpu
            break
        case 3
            sudo pacman -S xf86-video-intel
            set optimus 1
            break
        case 4
            break
    end
end

echo $seperator
echo "Installing qtile, kitty, rofi"
sudo pacman -S qtile kitty rofi

echo $seperator
while true
    read -l -P "Install pikaur? [Y/n] [Mandatory for optimus]" value
    switch $value
        case '' y Y
            sudo pacman -S --needed base-devel git
            git clone https://aur.archlinux.org/pikaur.git
            cd pikaur
            makepkg -fsri
            set helper pikaur
            break
        case n N
            read -l -P "Enter name of your AUR Helper:" helper
            $helper -Syu
            read -l -P "Are you sure? [Y/n]" value
            switch $value
                case '' y y
                    break
            end
    end
end

if set -q optimus
    $helper -S optimus-manager
end

echo $seperator
echo "Installing polybar, eww"
$helper -S polybar eww-git

echo $seperator
echo "Installing picom (git version because it has experimental dual_kawase blur"
$helper -S picom-git

echo $seperator
echo "Installation done, copying config files"
ln -sv $current/config/qtile/ ~/.config
ln -sv $current/config/eww ~/.config
ln -sv $current/config/polybar ~/.config