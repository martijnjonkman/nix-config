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
    home.file.".config/polybar/config.ini".source = ./dotfiles/polybar/config.ini;
    home.file.".config/polybar/launch.sh" = {
      source = ./dotfiles/polybar/launch.sh;
      executable = true;
    };

    home.file.".config/autorandr/dual/setup".source = ./dotfiles/autorandr/dual/setup;
    home.file.".config/autorandr/dual/config".source = ./dotfiles/autorandr/dual/config;
    home.file.".config/autorandr/dual/postswitch" = {
      source = ./dotfiles/autorandr/dual/postswitch;
      executable = true;
    };

    home.file.".config/autorandr/hdmi-only/setup".source = ./dotfiles/autorandr/hdmi-only/setup;
    home.file.".config/autorandr/hdmi-only/config".source = ./dotfiles/autorandr/hdmi-only/config;
    home.file.".config/autorandr/hdmi-only/postswitch" = {
      source = ./dotfiles/autorandr/hdmi-only/postswitch;
      executable = true;
    };
  };
}
