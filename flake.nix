{
  description = "Basic example of Nix-on-Droid system config.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nur-custom.url = "github:1235467/nix-on-droid-pkgs";
    nur-custom.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-on-droid, nur-custom, ... }@inputs:
    {

      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        modules = [
          ./nix-on-droid.nix

          # list of extra modules for Nix-on-Droid system
          # { nix.registry.nixpkgs.flake = nixpkgs; }
          # ./path/to/module.nix

          # or import source out-of-tree modules like:
          # flake.nixOnDroidModules.module
        ];

        # list of extra special args for Nix-on-Droid modules
        extraSpecialArgs = {
          inherit inputs;
        };

        # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
        pkgs = import nixpkgs {
          system = "aarch64-linux";

          overlays = [
            #nix-on-droid.overlays.default
            # add other overlays
          ];
        };

        # set path to home-manager flake
        home-manager-path = home-manager.outPath;
      };

    };
}
