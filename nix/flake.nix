{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nixpkgs-unstable
    , zen-browser
    , catppuccin
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      iso = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/iso/configuration.nix
        ];
      };

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          username = "vinicius";
          hostname = "nixos";
          pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true;};
        };
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      homeConfigurations."vinicius" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs outputs;
          inherit pkgs-unstable;
          inherit zen-browser;
          username = "vinicius";
          hyprlandProfile = "desktop";
        };
        modules = [
          catppuccin.homeManagerModules.catppuccin
          ./hosts/desktop/home.nix
        ];
      };
    };
}
