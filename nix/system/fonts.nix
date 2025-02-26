{ pkgs, ...}:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "DankMono" ]; })
    liberation_ttf
  ];
}
