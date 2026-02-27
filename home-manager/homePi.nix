 { config, pkgs, ... }:

{
  # this is internal compatibility configuration 
  # for home-manager, don't change this!
  home.stateVersion = "23.05";
  # Let home-manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "weitewand";
  home.homeDirectory = "/home/weitewand";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file.".config/nvim".source =
    ./home-manager/programs/nvim;
  home.file.".config/lazygit".source =
    ./home-manager/programs/lazygit;
  home.file.".config/alacritty".source =
    ./home-manager/programs/alacritty;
  home.file.".zshrc".source =
    ./home-manager/programs/zsh/.zshrc;

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
  };
}
