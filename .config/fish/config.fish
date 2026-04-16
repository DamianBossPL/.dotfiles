fish_add_path ~/.local/bin /usr/local/bin

set -gx XDG_DATA_DIRS "$HOME/.local/share:$XDG_DATA_DIRS"
set -gx TERMINAL footclient
set -gx EDITOR vim

if status is-login
  # Start Sway on tty1 
  if test -z "$WAYLAND_DISPLAY" -a (tty) = "/dev/tty1"
    if test -f /usr/bin/uwsm
      exec uwsm start sway
    else if test -f /usr/bin/sway
      # Replicate uwsm env behaviour
      # DINIT SUPPORTED ONLY

      set -x XDG_CURRENT_DESKTOP sway:wlroots
      set -x XDG_SESSION_DESKTOP sway
      dinitctl setenv XDG_CURRENT_DESKTOP=sway:wlroots
      dinitctl setenv XDG_SESSION_DESKTOP=sway

      while read -l line
        # Remove 'export ' prefix and split by '='
        set -l kv (string replace 'export ' '' -- $line | string split -m 1 '=')
        if test (count $kv) -eq 2
          set -l key $kv[1]
          set -l val (string trim -c '"' -- $kv[2])
          
          set -gx $key $val 
          dinitctl setenv "$key=$val"
        end
      end < ~/.config/uwsm/env

      dbus-update-activation-environment --all

      exec sway
    end
  end
end

if status is-interactive
  if test -f ~/.cache/terminal-sequences
    cat ~/.cache/terminal-sequences
  end

  alias ls='ls --color=auto -h'
  alias l='ls -la'
  alias grep='grep --color=auto'

  alias s='yay -Ss'
  alias i='yay --noconfirm -S'
  alias r='yay --noconfirm -Rns'
  alias u='yay --noconfirm'
  alias c='yay --noconfirm -Ycc'
  
  alias e='$EDITOR'

  fastfetch
end


function fish_prompt
  # # Directory and Git Info 
  # set_color blue
  # echo -n (prompt_pwd)
  # set_color yellow
  # echo -n (fish_vcs_prompt)

  # Locked status variable because $status changes as the function runs
  set -l last_status $status

  # Determines color for user segment
  set -l user_color cyan
  if set -q SSH_CONNECTION
    set user_color yellow
  end

  set_color $user_color
  echo -n ""
  set_color --reset -b $user_color
  
  echo -n "$USER@$hostname "

  set_color --reset $user_color -b blue
  echo -n ""
  set_color --reset -b blue
  
  echo -n " $(prompt_pwd) "

  # Displays red on non-zero exit
  set -l prompt_color brblack
  if test $last_status -ne 0
    set prompt_color red
  end
  
  set_color --reset blue -b $prompt_color
  echo -n ""
  set_color --reset -b $prompt_color

  if fish_is_root_user
    echo -n " # "
  else
    echo -n " \$ "
  end

  set_color --reset -f $prompt_color
  echo -n " "
  set_color --reset
end

if test -f /usr/bin/notify-send && set -q SSH_CONNECTION
  set USER_IP $(echo $SSH_CONNECTION | awk '{print $1}')
  notify-send --urgency=critical "Incoming SSH" "$USER_IP"

  function on_exit --on-event fish_exit
    notify-send --urgency=normal "Closed SSH" "$USER_IP"
  end

  function monitor_commands --on-event fish_preexec
    set -l command $argv[1]
    notify-send --urgency=low "SSH Command $user_ip" "$command"
  end
end
