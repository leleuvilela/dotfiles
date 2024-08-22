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
      package = pkgs.gnome.gnome-themes-extra;
    };

    cursorTheme = {
        name = "Adwaita";
        size = 28;
        package = pkgs.gnome.adwaita-icon-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=Adwaita-dark
        gtk-cursor-theme-size=28
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=Adwaita-dark
        gtk-cursor-theme-size=28
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
}

