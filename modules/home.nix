{ ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";

  home-manager.users.martijn = { pkgs, ... }: {
    home.stateVersion = "25.11";

    gtk = {
      enable = true;
      theme = {
        name = "Gruvbox-Dark";
        package = pkgs.gruvbox-gtk-theme;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 10;
      };
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };

    # Note: xfconf.settings requires a running XFCE session
    # Configure panels manually: right-click panel -> Panel -> Panel Preferences
    # Add second panel, set Output to your second monitor, add pulseaudio plugin

    programs.vim = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/vim/vimrc;
    };

    home.file.".config/rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
    home.file.".config/rofi/theme.rasi".source = ./dotfiles/rofi/theme.rasi;
    home.file.".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;
    home.file.".config/oxwm/config.lua".source = ./dotfiles/oxwm/config.lua;

    programs.autorandr = {
      enable = true;
      profiles = {
        dual = {
          fingerprint = {
            DisplayPort-1 = "00ffffffffffff0006b3b127983c0000171c0104a53c227806ee91a3544c99260f505421080001010101010101010101010101010101565e00a0a0a029503020350056502100001a000000ff002341534e5a50575a7168734864000000fd001e9022de3b010a202020202020000000fc00524f4720504732373851520a2001f6020312412309070183010000654b040001015a8700a0a0a03b503020350056502100001a5aa000a0a0a046503020350056502100001a6fc200a0a0a055503020350056502100001a22e50050a0a0675008203a0056502100001e1c2500a0a0a011503020350056502100001a0000000000000000000000000000000000000019";
            HDMI-A-0 = "00ffffffffffff0026cd6c66f505000020200103803c2278eaa255ac5046ab260c5054254b009500a9c0a900a940b300d1c0d100e100565e00a0a0a029503020350055502100001a000000ff0031313833323233323031353235000000fd0028901ede3c000a202020202020000000fc00504c3237373051530a2020202001c1020356f155905d1404020360610111121316060715051f5a5f3f23090707830100006c030c0010003844200040010367d85dc4017880036d1a0000020b2890e606702c722ee20fc0e6060d01737320e305c301e200ea9ee80078a0a067500820980455502100001a6fc200a0a0a055503020350055502100001a000000000033";
          };
          config = {
            DisplayPort-1 = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "2560x1440";
              rate = "144.00";
            };
            HDMI-A-0 = {
              enable = true;
              position = "2560x0";
              mode = "2560x1440";
              rate = "144.01";
            };
          };
        };
        hdmi-only = {
          fingerprint = {
            HDMI-A-0 = "00ffffffffffff0026cd6c66f505000020200103803c2278eaa255ac5046ab260c5054254b009500a9c0a900a940b300d1c0d100e100565e00a0a0a029503020350055502100001a000000ff0031313833323233323031353235000000fd0028901ede3c000a202020202020000000fc00504c3237373051530a2020202001c1020356f155905d1404020360610111121316060715051f5a5f3f23090707830100006c030c0010003844200040010367d85dc4017880036d1a0000020b2890e606702c722ee20fc0e6060d01737320e305c301e200ea9ee80078a0a067500820980455502100001a6fc200a0a0a055503020350055502100001a000000000033";
          };
          config = {
            HDMI-A-0 = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "2560x1440";
              rate = "144.01";
            };
          };
        };
      };
    };
  };
}
