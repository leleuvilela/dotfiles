{ pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs; [
    # langs
    (lib.hiPrio gcc)
    (lib.lowPrio clang)
    cargo
    nodejs
    yarn

    # dev tools
    pkgs-unstable.neovim
    pkgs-unstable.lazygit
    docker
    docker-compose
    lazydocker
    awscli
    aws-sam-cli
    terraform
    postman
    postgresql
    postgresql_jdbc
    typescript
    jdk
    postman
    playwright-driver.browsers
    chromium
    electron-fiddle
    electron
    pkgs-unstable.mockoon

    #raspbery
    rpiboot
    rpi-imager
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
    PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
  };
}
