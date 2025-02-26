{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "DankMono Nerd Font";
      size = 12;
    };
    themeFile = "Catppuccin-Mocha";
    shellIntegration = {
      enableZshIntegration = true;
    };
    keybindings = {
      "ctrl+equal" = "change_font_size all +2.0";
      "ctrl+plus" = "change_font_size all +2.0";
      "ctrl+minus" = "change_font_size all -2.0";
    };
    settings = {
      background_opacity = "0.9";
    };
  };
}
