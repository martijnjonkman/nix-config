{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "cifs" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";
 
  fileSystems."/mnt/truenas" = {
    device = "//192.168.1.44/data";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "_netdev"
      "vers=3.0"
      "credentials=/etc/nixos/secrets/truenas"
      "uid=1000"
      "gid=100"
      "file_mode=0644"
      "dir_mode=0755"
    ];
  };
 
  nixpkgs.config.allowUnfree =  true;

  services.libinput = {
    enable = true;
    mouse = {
      middleEmulation = false;
    };
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
  
  users.users.martijn = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };


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
  ];
  
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
  
  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  system.stateVersion = "25.11"; # Did you read the comment?

}

