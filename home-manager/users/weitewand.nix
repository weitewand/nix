{ config, pkgs, ... }:

{
  # this is internal compatibility configuration 
  # for home-manager, don't change this!
  home.stateVersion = "23.05";
  # Let home-manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [];

  home.username = "weitewand";
  home.homeDirectory = "/Users/weitewand";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file.".config/nvim".source =
    ./../../nvim;
  home.file.".config/lazygit".source =
    ./../../lazygit;
  home.file.".config/alacritty".source =
    ./../../alacritty;
  home.file.".zshrc".source =
    ./../../zsh/.zshrc;

  # Git config
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "weitewand";
        email = "kieckhaefer@posteo.de";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
    ignores = [ ".DS_Store" ];
  };

  # VSCode
  programs.vscode = {
    enable = true;
  };
}
