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
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }: {

    nixosConfigurations."homePi" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/rpi5/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.users.homepi = import ./home-manager/homePi.nix;
        }
      ];
    };

    darwinConfigurations."weitewandMB" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        systemRevision = self.rev or self.dirtyRev or null;
      };
      modules = [
        ./hosts/weitewandMB/configuration.nix
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

