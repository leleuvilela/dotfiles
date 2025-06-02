{ config, pkgs, hyprlandProfile, ... }:
{
  imports = [
    ./xdg.nix
    ./wlogout.nix
    ./swaylock.nix
    ./waybar.nix
    ./wofi.nix
    ./swaync.nix
    ./gtk.nix
  ];

  home.packages = with pkgs; [
    waybar
    swww
    cliphist
    networkmanagerapplet
    gnome-icon-theme
    pulseaudio
    libnotify
    catppuccin-gtk
    nwg-look
    nautilus
    grim
    slurp
    swappy
  ];
 
  home.file = {
    ".config/hypr/hyprland.conf".source = ./${hyprlandProfile}.conf;
  };
}
