{ pkgs,... }:
{
  home.packages = with pkgs; [
    brave
    firefox
    my-edge
  ];
}
