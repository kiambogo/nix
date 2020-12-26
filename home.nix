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
  kitty = {
    enable = true;
    font = {
      package = pkgs.fira-code;
      name = "Fira Code 11";
    };
    keybindings = {
      "cmd+equal" = "change_font_size all +2.0";
      "cmd+minus" = "change_font_size all -2.0";
      "cmd+backspace" = "change_font_size all 0";
      "cmd+c" = "copy_to_clipboard";
      "cmd+v" = "paste_from_clipboard";
    };
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = "no";
      window_padding_width = "3.0";
      hide_window_decorations = "yes";

      foreground = "#bfbfbf";
      background = "#282a2e";
      selection_background = "#5c4c79";
      url_color =              "#29a1ae";
      color0    =              "#292b2d";
      color8    =              "#68717b";
      color1    =              "#ce527a";
      color9    =              "#ce527a";
      color2    =              "#2d9474";
      color10   =              "#84d82f";
      color3    =              "#bfa325";
      color11   =              "#edad0d";
      color4    =              "#4e97d6";
      color12   =              "#4c91cc";
      color5    =              "#bb6dc3";
      color13   =              "#bb6dc3";
      color6    =              "#299ba2";
      color14   =              "#299ba2";
      color7    =              "#e4e4e4";
      color15   =              "#f2f2f2";
    };
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
