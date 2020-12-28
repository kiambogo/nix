{ config, pkgs, ... }:

{
  imports = [
    ./config/kitty.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "christopher";
  home.homeDirectory = "/home/christopher";

  home.file.".emacs.d" = {
    # don't make the directory read only so that impure melpa can still happen
    # for now
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "syl20bnr";
      repo = "spacemacs";
      rev = "26b8fe0c317915b622825877eb5e5bdae88fb2b2";
      sha256 = "00cfm6caaz85rwlrbs8rm2878wgnph6342i9688w4dji3dgyz3rz";
    };
  };

  services = {
  };

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
  tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 10000;
    keyMode = "vi";
    plugins = with pkgs; [
      tmuxPlugins.yank
    ];
    extraConfig = ''
      set-option -g renumber-windows on
      set-window-option -g automatic-rename on
      set-option -g set-titles on
      set -sg escape-time 0
      bind-key v split-window -h
      bind-key s split-window -v
      bind-key -n C-S-Left swap-window -t -1
      bind-key -n C-S-Right swap-window -t +1
      set -g prefix C-a
      unbind C-b
      bind C-a send-prefix
      bind -n C-h run "tmux select-pane -L"
      bind -n C-j run "tmux select-pane -D"
      bind -n C-k run "tmux select-pane -U"
      bind -n C-l run "tmux select-pane -R"
      unbind-key -T copy-mode-vi v
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi 'C-v' send-keys -X rectangle-toggle
      bind-key r source-file ~/.tmux.conf \; display "Config reloaded!"
    '';
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
