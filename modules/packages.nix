{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    tree
    wget
    git
    cifs-utils
    alacritty
    btop
    
    xwallpaper
    i3
    i3status
    polybar
    rofi
    dunst
    feh

    autorandr
    arandr
    
    pcmanfm
    pfetch
    discord
    protonup-ng
    xdotool
    xorg.xprop
    wowup-cf
    lm_sensors
    flameshot

    eve-preview-manager
  ];
}
