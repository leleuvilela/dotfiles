{ config, pkgs, inputs, ... }:
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  catppuccin = {
    flavor = "mocha";
    enable = true;
  };

  programs.starship = {
    enable = true;
    catppuccin.enable = true;
  };

}

