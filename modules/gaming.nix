{ pkgs, ... }:

{
  programs.corectrl.enable = true;
  hardware.amdgpu.overdrive.enable = true;

  programs.firefox.enable = true;
  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  environment.systemPackages = with pkgs; [
    discord
    eve-preview-manager
    protonup-ng
    wowup-cf
    xdotool
    xorg.xprop
  ];
}
