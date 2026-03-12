{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    videoDrivers = [ "amdgpu" ];

    displayManager.sessionCommands = ''
      feh --bg-zoom ~/nixos-config/assets/wallpapers/cosy-retreat.png &
      xset r rate 200 35 &
      dunst &
      polybar main &
    '';

    displayManager.setupCommands = ''
      ${pkgs.xorg.xrandr}/bin/xrandr \
        --output DisplayPort-1 --mode 2560x1440 --rate 144 --primary \
        --output HDMI-A-0 --mode 2560x1440 --rate 144 --right-of DisplayPort-1
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
