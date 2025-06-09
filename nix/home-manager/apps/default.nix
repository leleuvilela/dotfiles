{ pkgs, pkgs-unstable, ... }:
{
  imports = [
    ./git
    ./browser
    ./vpn
    ./brightness.nix
  ];

  home.packages = with pkgs; [
    slack
    obsidian
    pavucontrol
    vlc
    os-prober
    obs-studio
    stremio
    evince
    sxiv
    teams-for-linux
    file-roller
    libreoffice
    gnome-disk-utility
    gnome-calculator
    adwaita-icon-theme
    mongodb-compass
    vesktop
    virtualbox
    woeusb
    vscode
    blueman
    solaar
    atlauncher
    cider
    mission-center
    steam
    networkmanager
    spotify
    modrinth-app
    duckstation
    pinta
  ];
}
