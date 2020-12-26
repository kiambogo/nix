{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "christopher";
  home.homeDirectory = "/home/christopher";

 programs = {
   firefox = {
    enable = true;
    profiles = {
      personal = {
        id = 0;
        isDefault = false;
        settings = {
          "general.smoothScroll" = false;
        };
      };
      work = {
        id = 1;
        isDefault = true;
        settings = {
          "general.smoothScroll" = false;
        };
      };
    };
  };
  git = {
    enable = true;
    userEmail = "kiambogo@gmail.com";
    userName = "Christopher Poenaru";
    aliases = { st = "status"; lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"; };
    extraConfig = { core = { editor = "vim"; }; color = { ui = true; }; pull = { rebase = true; }; };
  };
};

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
