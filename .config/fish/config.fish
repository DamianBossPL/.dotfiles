fish_add_path ~/.local/bin /usr/local/bin

set -gx XDG_DATA_DIRS "$HOME/.local/share:$XDG_DATA_DIRS"
set -gx TERMINAL foot
set -gx EDITOR vim

if status is-login
  # Start Sway on tty1 
  if test -z "$WAYLAND_DISPLAY" -a (tty) = "/dev/tty1"
    exec uwsm start sway
  end
end

if status is-interactive
  if test -f ~/.cache/wal/sequences
    cat ~/.cache/wal/sequences
  end

  alias ls='ls --color=auto -h'
  alias l='ls -l'
  alias la='ls -la'
  alias grep='grep --color=auto'

  fastfetch
end


function fish_prompt
  echo -n \n

  set -l last_status $status
  set -l prompt_color green

  # Warn user of active ssh
  if set -q SSH_CONNECTION
    set prompt_color red
  end

  
  set_color $prompt_color
  echo -n "[$USER@$hostname"
  
  # Exit status if error
  if test $last_status -ne 0
    set_color red
    echo -n " $last_status"
  end
  set_color $prompt_color
  echo -n "] "

  # Directory and Git Info 
  set_color blue
  echo -n (prompt_pwd)
  set_color yellow
  echo -n (fish_vcs_prompt)

  # New line and symbol
  echo
  set_color normal
  if fish_is_root_user
    echo -n "# "
  else
    echo -n "\$ "
  end
end
