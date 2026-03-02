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
    pcmanfm
    rofi
    pfetch
    discord
    protonup-ng
    wowup-cf
    lm_sensors

    eve-preview-manager
  ];
}
