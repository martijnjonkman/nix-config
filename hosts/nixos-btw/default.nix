{ ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/common.nix
      ../../modules/desktop.nix
      ../../modules/gaming.nix
      ../../modules/packages.nix
    ];
  
  networking.hostName = "nixos-btw";
  time.timeZone = "Europe/Amsterdam";
 
  fileSystems."/mnt/truenas" = {
    device = "//192.168.1.44/data";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
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

  users.users.martijn = {
    isNormalUser = true;
    extraGroups = [ "wheel" "corectrl" ];
    packages = [ ];
  };

  system.stateVersion = "25.11";
}
