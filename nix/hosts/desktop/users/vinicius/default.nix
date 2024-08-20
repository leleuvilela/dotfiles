{ username, ...}:
{
  users.users.${username} = {
    isNormalUser = true;
    description = "vinicius";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  nix.settings.trusted-users = [ "root" "vinicius" ];
}
