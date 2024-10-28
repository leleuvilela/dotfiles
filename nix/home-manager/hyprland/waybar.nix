{ pkgs, hyprlandProfile, ... }:
{

  home.packages = with pkgs; [
    waybar
  ];

  home.file = {
    ".config/waybar/config.jsonc".source = ../../../waybar/config-${hyprlandProfile}.jsonc;
    ".config/waybar/style.css".source = ../../../waybar/style.css;
    ".config/waybar/mocha.css".source = ../../../waybar/mocha.css;
  };
}
