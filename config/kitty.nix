{ config, pkgs, ... }: 

{
 programs.kitty = {
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
}
