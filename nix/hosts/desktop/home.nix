{ outputs, config, pkgs, pkgs-unstable, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.stateVersion = "24.05";

  imports = [
    ../../home-manager/hyprland
    ../../home-manager/apps
    ../../home-manager/terminal
    ../../home-manager/dev
  ];

  programs = {
    home-manager = {
      enable = true;
    };
  };
}
