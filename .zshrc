# Terminal colors
[[ -f ~/.cache/wal/colors-tty.sh ]] && source ~/.cache/wal/colors-tty.sh

# Env
export EDITOR=vim

# Completion
autoload -Uz compinit
compinit

# Keybinding
bindkey -e

# Git Info
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Aliases
alias srv='ssh cap -t "sudo pacman -Syu && fastfetch"'
alias ls='ls --color=auto -h'
alias l='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'

# --- Prompt --- #
setopt PROMPT_SUBST
# Normal use GREEN, ssh use RED
if [[ -n $SSH_CONNECTION ]]; then
  PROMPT_COLOR="red"
else
  PROMPT_COLOR="green"
fi
PROMPT='
[%F{$PROMPT_COLOR}%n@%m%f] %F{blue}%~%f %F{yellow}${vcs_info_msg_0_}%f
%# '

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh