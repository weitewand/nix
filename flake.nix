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
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: 
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."weitewandMB" = nix-darwin.lib.darwinSystem {
      specialArgs = {
        systemRevision = self.rev or self.dirtyRev or null;
      };
      modules = [ 
        ./darwin/hosts/weitewandMB/configuration.nix 
	home-manager.darwinModules.home-manager {
	   home-manager.useGlobalPkgs = true;
	   home-manager.useUserPackages = true;
	   home-manager.verbose = true;
	   home-manager.users.weitewand = import ./home-manager/users/weitewand.nix;
	}
      ];
    };
  };
}
