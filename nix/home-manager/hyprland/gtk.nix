{ config , pkgs , inputs , ... }:
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "LiberationSerif-Regular";
      size = 12;
    };
    theme = {
      name = "Adwaita-dark";
      size = 32;
      package = pkgs.gnome.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=Adwaita-dark
        gtk-cursor-theme-size=32
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  qt = {
    enable = true;
    platformTheme = {
      name = "gtk";
    };
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };


  home.sessionVariables.GTK_THEME = "Adwaita-dark";
  environment.variables.XCURSOR_SIZE = "32";
}

