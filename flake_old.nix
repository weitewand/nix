{ description = "weitewands nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: 
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."weitewandMB" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        systemRevision = self.rev or self.dirtyRev or null;
      };
      modules = [ 
        ./darwin/hosts/weitewandMB/configuration.nix 
        # mac-app-util.darwinModules.default
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.verbose = true;
          home-manager.users.weitewand = import ./home-manager/users/weitewand.nix;
          # home-manager.sharedModules = [
          #   mac-app-util.homeManagerModules.default
          # ];
        }
      ];
    };

    darwinConfigurations."homepi" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [ 
        ./darwin/hosts/homepi/configuration.nix 
      ];
    };
  };
}
