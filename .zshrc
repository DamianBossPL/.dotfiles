# --------------------------- #
# --- Shell Configuration --- #
# --------------------------- #

# --- Variables --- #
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export EDITOR=vim

source ~/.cache/wal/colors-tty.sh

# --- OMZ Configuration --- #
ZSH_THEME="intheloop" # Theme
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

zstyle ':omz:update' mode disabled  # Disable Auto-update

source $ZSH/oh-my-zsh.sh

# --- User configuration --- #
alias srv='ssh -t beacon "sudo pacman -Syu && fastfetch"'
