# Terminal colors
[[ -f ~/.cache/wal/colors-tty.sh ]] && source ~/.cache/wal/colors-tty.sh

# Env
export EDITOR=vim

# --- Useful Options --- #
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CORRECT
setopt NO_BEEP
setopt INTERACTIVE_COMMENTS

# --- Completion --- #
autoload -Uz compinit && compinit
zmodload zsh/complist

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Group completions by category (files, commands, etc)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# --- Keybinding --- #
bindkey -e
# Filter history by prompt
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search # Up Arrow
bindkey '^[[B' down-line-or-beginning-search # Down Arrow

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