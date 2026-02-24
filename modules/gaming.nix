{ ... }:

{
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
}
