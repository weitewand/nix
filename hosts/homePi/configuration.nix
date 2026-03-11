
{ config, pkgs, ... }:

{
  #########################
  # Basic system settings #
  #########################

  networking = {
    networkmanager.enable = true;
    };
 
  # Enable OpenSSH server
  services.openssh.enable = true;

  # Allow password authentication (initial setup)
  services.openssh.settings.PasswordAuthentication = true;

  # Optional: extra SSH configuration
  services.openssh.extraConfig = ''
    PermitRootLogin no
    PubkeyAuthentication yes
  '';
  
  swapDevices = [
    { device = "/swapfile"; size = 2048; }
  ];

  ###################
  # Users & Sudo    #
  ###################
  users.users.weitewand = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # allows sudo
    shell = pkgs.zsh;
  };

  # Let wheel group use sudo without password
  security.sudo.wheelNeedsPassword = false;

  #####################
  # System state version
  #####################
  # Match the NixOS release you're using
  system.stateVersion = "24.11";

  ###################
  # Minimal packages #
  ###################
  environment.systemPackages = with pkgs; [
    vim
    git
    htop
  ];
}
