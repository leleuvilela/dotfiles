{ username, ...}:
{
  users.users.${username} = {
    isNormalUser = true;
    description = "vinicius";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
