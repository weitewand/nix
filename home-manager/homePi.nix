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
    ./programs/nvim;
  home.file.".config/lazygit".source =
    ./programs/lazygit;
  home.file.".config/alacritty".source =
    ./programs/alacritty;
  home.file.".zshrc".source =
    ./programs/zsh/.zshrc;

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
