{ pkgs, unstable, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.displayManager.defaultSession = "none+oxwm";

  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    displayManager.lightdm = {
      enable = true;
      background = ../assets/wallpapers/5m5kLI9.png;
    };
    videoDrivers = [ "amdgpu" ];

    windowManager.session = [{
      name = "oxwm";
      start = ''
        ${unstable.oxwm}/bin/oxwm &
        waitPID=$!
      '';
    }];

    displayManager.sessionCommands = ''
      xset r rate 200 35 &
      ${pkgs.autorandr}/bin/autorandr --change --default hdmi-only &
    '';
  };

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
    vSync = false;
    settings = {
      unredir-if-possible = true;
      unredir-if-possible-exclude = [
        "class_g = 'EVE Online'"
      ];
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    alacritty
    arandr
    autorandr
    dunst
    feh
    flameshot
    gruvbox-gtk-theme
    unstable.oxwm
    papirus-icon-theme
    pavucontrol
    pcmanfm
    playerctl
    resources
    rofi
    xfce.xfce4-pulseaudio-plugin
  ];
}
