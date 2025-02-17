{ pkgs, pkgs-unstable,... }:
{
  home.packages = with pkgs; [
    brave
    pkgs-unstable.microsoft-edge
    firefox
  ];
}
