# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ferdinandkieckhaefer/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add eza completions
export FPATH="~/Dokumente/03_tools/eza/completions/zsh:$FPATH"

# Alias for eza
alias ll="eza -l"
alias lla="eza -al"

# Alias for darwin/nix
alias switch="sudo darwin-rebuild switch --flake ~/.config/nix-darwin-config"

eval "$(starship init zsh)"
