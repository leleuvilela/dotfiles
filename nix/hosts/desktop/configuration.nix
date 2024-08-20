{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../hosts/desktop/users/vinicius
      ../../system/sddm
      ../../system/nix.nix
      ../../system/boot.nix
      ../../system/hyprland.nix
      ../../system/locale.nix
      ../../system/docker.nix
      ../../system/zsh.nix
      ../../system/pipewire.nix
      ../../system/redshift.nix
      ../../system/fonts.nix
      ../../system/via.nix
      ../../system/firewall.nix
    ];

  environment = {
    variables.EDITOR = "nvim";
    systemPackages = with pkgs; [
      vim
      neovim
      git
      stow
      home-manager
    ];
  };

  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;

  system.stateVersion = "24.05";

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
