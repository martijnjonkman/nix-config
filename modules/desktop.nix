{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.displayManager.defaultSession = "none+i3";

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    displayManager.lightdm = {
      enable = true;
      background = ./assets/wallpapers/cosy-retreat.png;
    };
    videoDrivers = [ "amdgpu" ];

    displayManager.sessionCommands = ''
      xset r rate 200 35 &
    '';

    displayManager.setupCommands = ''
      ${pkgs.xorg.xrandr}/bin/xrandr \
        --output HDMI-A-0 --mode 2560x1440 --rate 144
    '';
  };

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
    vSync = true;
    settings = {
      unredir-if-possible = true;
      unredir-if-possible-exclude = [
        "class_g = 'EVE Online'"
      ];
    };
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}
