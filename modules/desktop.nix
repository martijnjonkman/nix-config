{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;

    displayManager.sessionCommands = ''
      xwallpaper --zoom ~/Downloads/walls/cosy-retreat.png
      xset r rate 200 35 &
    '';

    displayManager.setupCommands = ''
      ${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-1 --mode 2560x1440 --rate 144
      ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-0 --mode 2560x1440 --rate 144
    '';

    videoDrivers = [ "amdgpu" ];
  };

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
