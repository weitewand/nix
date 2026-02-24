
{ config, pkgs, ... }:

let
  secrets = import ./secrets/wifi.nix
in
{
  #########################
  # Basic system settings #
  #########################

  networking = {
    hostname = "homepi";
    wireless.enable = true;
    wireless.networks = {
      "FooFighters_EXT" = {
        psk = secrets.wifiPassword;
      };
    useDHCP = true;
    };
 
  # Enable OpenSSH server
  services.openssh.enable = true;

  # Allow password authentication (initial setup)
  services.openssh.passwordAuthentication = true;

  # Optional: extra SSH configuration
  services.openssh.extraConfig = ''
    PermitRootLogin no
    PubkeyAuthentication yes
  '';

  ###################
  # Users & Sudo    #
  ###################
  users.users.nix = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # allows sudo
    initialPassword = "changeme"; # change this after first login
  };

  # Let wheel group use sudo without password
  security.sudo.wheelNeedsPassword = false;

  ##########################
  # Bootloader & firmware  #
  ##########################
  boot.loader.generic-extlinux-compatible.enable = true;
  hardware.enableRedistributableFirmware = true;

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
