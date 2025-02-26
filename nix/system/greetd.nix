{config, lig, pkgs}:
{
  services.greetd = {
    enable = false;
    settings = {
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "vinicius";
      };
      default_session = {
        command = "initial_session";
      };
    };
  };
  environment.etc."greetd/environments".text = ''
    Hey hey
  '';
}
