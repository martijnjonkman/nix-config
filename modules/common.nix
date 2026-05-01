{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.settings.auto-optimise-store = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  services.libinput = {
    enable = true;
    mouse.middleEmulation = false;
  };

  boot.supportedFilesystems = [ "cifs" ];

  environment.systemPackages = with pkgs; [
    btop
    cifs-utils
    git
    kdePackages.kate
    lm_sensors
    tree
    vim
    wget
  ];
}
