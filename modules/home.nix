{ ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";

  home-manager.users.martijn = {
    home.stateVersion = "25.11";

    xsession.windowManager.i3 = {
      enable = true;
      config = null;
      extraConfig = builtins.readFile ./dotfiles/i3/config;
    };

    programs.vim = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/vim/vimrc;
    };

    home.file.".config/rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
    home.file.".config/rofi/theme.rasi".source = ./dotfiles/rofi/theme.rasi;
    home.file.".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;
  };
}
