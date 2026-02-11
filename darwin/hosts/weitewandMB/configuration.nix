{ config, pkgs, systemRevision, ... }:

{
  nix.enable = false;

  # In order to have VSCode managed by nix:
  nixpkgs.config.allowUnfree = true;

  system.primaryUser = "weitewand";

  environment.systemPath = [
    "/opt/homebrew/bin" # add the binaries installed via homebrew to the path
  ];
  
  # enable TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ 
    pkgs.neofetch 
    pkgs.neovim 
    pkgs.lazygit
    pkgs.eza
    pkgs.docker
    pkgs.docker-compose
  ];
  
  # Declare the user that will be running `nix-darwin`.
  users.users.weitewand = {
    name = "weitewand";
    home = "/Users/weitewand";
  };
  
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = systemRevision;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;
 
  homebrew = {
    enable = true;
    # remove packages that are not defined here to make it declarative:
    onActivation.cleanup = "uninstall"; 

    taps =[];
    brews = [ "cowsay" ];
    casks = [ 
      "signal" 
      "docker"
    ];
  };

  # Install fonts:
  fonts.packages = [
    pkgs.nerd-fonts.geist-mono
  ];

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };
}
