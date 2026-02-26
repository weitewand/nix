 { config, pkgs, ... }:

{
  # this is internal compatibility configuration 
  # for home-manager, don't change this!
  home.stateVersion = "23.05";
  # Let home-manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.uv
    #pkgs.texliveMedium
    (pkgs.texlive.combine {
    inherit (pkgs.texlive)
      fontawesome5
      textpos
      scheme-small
      latexmk
      biblatex
      biber;
    })
  ];

  home.username = "weitewand";
  home.homeDirectory = "/Users/weitewand";

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
    ignores = [ ".DS_Store" ];
  };

  # VSCode
  programs.vscode = {
    enable = true;
  };
  # neovim
  programs.neovim = {
    enable = true;

    # Use built-in package manager support
    plugins = [
      pkgs.vimPlugins.which-key-nvim
      pkgs.vimPlugins.indent-blankline-nvim
      pkgs.vimPlugins.neo-tree-nvim
      pkgs.vimPlugins.plenary-nvim
      pkgs.vimPlugins.nui-nvim
      pkgs.vimPlugins.nvim-web-devicons
    ];
  };
}
