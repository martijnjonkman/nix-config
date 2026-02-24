{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    cifs-utils
    neovim
    alacritty
    btop
    xwallpaper
    pcmanfm
    rofi
    pfetch
    discord
    mangohud
    protonup-ng
    wowup-cf

    eve-preview-manager
  ];
}
