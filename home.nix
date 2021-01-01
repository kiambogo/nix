{ config, pkgs, ... }:

{
  imports = [
    ./config/kitty.nix
    ./config/tmux.nix
    ./config/bash.nix
    ./config/go.nix
    ./config/git.nix
    ./config/spacemacs.nix
    ./config/firefox.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "christopher";
  home.homeDirectory = "/home/christopher";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
