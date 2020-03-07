# remap prefix to Control + a
set -g prefix C-a
# bind 'C-a C-a' to type 'C-a'
bind C-a send-prefix
unbind C-b

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
setw -g mode-keys vi

setw -g monitor-activity on
set -g mouse on

source-file "${HOME}/tmux-themepack/powerline/default/blue.tmuxtheme"
