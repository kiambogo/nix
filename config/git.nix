{ config, pkgs, ... }: 

{
  programs.git = {
    enable = true;
    userEmail = "kiambogo@gmail.com";
    userName = "Christopher Poenaru";
    aliases = {
      st = "status";
      d = "diff";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    extraConfig = {
      core = { editor = "vim"; };
      color = { ui = true; };
      pull = { rebase = true; };
    };
  };
}
