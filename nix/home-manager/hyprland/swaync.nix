{ pkgs, ... }:
{

  home.packages = with pkgs; [
    swaynotificationcenter
  ];

  home.file = {
    ".config/swaync/style.css".source = ../../../swaync/style.css;
  };
}
