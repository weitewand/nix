{
  description = "weitewands machines";

  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-raspberrypi.url =
      "github:nvmd/nixos-raspberrypi/main";
  };

  outputs = { self, nixpkgs, home-manager, darwin, nixos-raspberrypi, ... }: {

    nixosConfigurations."homePi" = nixos-raspberrypi.lib.nixosSystemFull {
      system = "aarch64-linux";

      specialArgs = {
        inherit nixos-raspberrypi;
      };

      modules = [
	./modules/shared/shell.nix
        ./hosts/homePi/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.users.weitewand = import ./home-manager/homePi.nix;
        }
      ];
    };

    darwinConfigurations."weitewandMB" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        systemRevision = self.rev or self.dirtyRev or null;
      };
      modules = [
          ({ nixos-raspberrypi, ... }: {
            imports = with nixos-raspberrypi.nixosModules; [
              raspberry-pi-5.base
              raspberry-pi-5.display-vc4
            ];
          })

        ./hosts/weitewandMB/configuration.nix
	./modules/shared/shell.nix
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.verbose = true;
          home-manager.users.weitewand = import ./home-manager/weitewandMB.nix;
        }
      ];
    };
  };
}
