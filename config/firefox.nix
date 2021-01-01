{ config, pkgs, ... }: 

{
  programs.firefox = {
    enable = true;
    profiles = {
      personal = {
        id = 0;
        isDefault = true;
        settings = {
          "general.smoothScroll" = false;
        };
      };
      work = {
        id = 1;
        isDefault = false;
        settings = {
          "general.smoothScroll" = false;
        };
      };
    };
  };
}
