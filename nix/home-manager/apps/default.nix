{ pkgs, pkgs-unstable, zen-browser, ... }:
{
  imports = [
    ./git
    ./browser
    ./vpn
    ./brightness.nix
  ];

  home.packages = with pkgs; [
    cinnamon.nemo-with-extensions
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
    gnome.file-roller
    libreoffice
    gnome.gnome-disk-utility
    gnome.gnome-calculator
    gnome.adwaita-icon-theme
    mongodb-compass
    vesktop
    virtualbox
    woeusb
    vscode
    blueman
    solaar
    zen-browser.packages.x86_64-linux.default
    atlauncher
    cider
    mission-center
    steam
    morgen
    networkmanager
    spotify
  ];
}
