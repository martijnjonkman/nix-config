{ ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  services.libinput = {
    enable = true;
    mouse.middleEmulation = false;
  };

  boot.supportedFilesystems = [ "cifs" ];

}
