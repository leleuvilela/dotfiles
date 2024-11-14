{ hostname, pkgs, ...}:
{
  # Nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Networking
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  security.polkit.enable = true;

  programs.nix-ld.dev.enable = true;

  programs.nix-ld.dev.libraries = with pkgs; [
    alsa-lib.out
    at-spi2-atk.out
    cairo.out
    cups.lib
    dbus.lib
    eudev.out
    expat.out
    glib.out
    gtk3.out
    libdrm.out
    libxkbcommon.out
    mesa.out
    nspr.out
    nss.out
    pango.out
    xorg.libX11.out
    xorg.libXcomposite.out
    xorg.libXdamage.out
    xorg.libXext.out
    xorg.libXfixes.out
    xorg.libXrandr.out
    xorg.libxcb.out
    libdrm
    mesa
    libxkbcommon
    libgcc.lib
    chromium
  ];
}
