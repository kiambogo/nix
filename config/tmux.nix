{ config, pkgs, ... }: 

{
  programs.tmux = {
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
}
