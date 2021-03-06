{ config, pkgs, ... }:

{
 programs.bash = {
    enable = true;
    bashrcExtra = ''
      source ~/.profile
    '';
    shellAliases = {
      ll = "ls -alGh --color";
      uuid = "uuidgen | tr '[A-Z]' '[a-z]'";
    };
    sessionVariables = {
      GO111MODULE = "on";
      GOPATH = "/home/christopher/go";
    };
    profileExtra = ''
      IWhite="\[\033[0;97m\]"
      Time12h="\T"
      Host="\h"
      Color_Off="\[\033[0m\]"
      PathShort="\w"
      IRed="\[\033[0;91m\]"
      Green="\[\033[0;32m\]"
      Turquoise="\[\033[38;5;6m\]"
      export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
      export PS1=$IWhite$Host": "$Turquoise"["$PathShort"]"$Color_Off'$(git branch &>/dev/null;\
      if [ $? -eq 0 ]; then \
        echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
        if [ "$?" -eq "0" ]; then \
          # @4 - Clean repository - nothing to commit
          echo "'$Green'"$(__git_ps1 " (%s)"); \
        else \
          # @5 - Changes to working tree
          echo "'$IRed'"$(__git_ps1 " {%s}"); \
        fi) '$Color_Off'\$ "; \
      else \
        # @2 - Prompt when not in GIT repo
        echo " '$Color_Off'\$ "; \
      fi)'
    '';
  };
}
