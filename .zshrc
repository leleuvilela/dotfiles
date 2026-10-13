# Created by Phunt_Vieg_
# autoload -Uz zsh-newuser-install
# zsh-newuser-install -f# Lines configured by zsh-newuser-install
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory

# Keybind
bindkey -e

# Setup fzf
eval "$(fzf --zsh)"

# fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#3c3836,bg:#282828,spinner:#fbf1c7,hl:#fb4934 \
--color=fg:#ebdbb2,header:#fb4934,info:#d3869b,pointer:#fbf1c7 \
--color=marker:#83a598,fg+:#ebdbb2,prompt:#d3869b,hl+:#fb4934 \
--color=selected-bg:#504945 \
--color=border:#3c3836,label:#ebdbb2"
export FZF_TAB_COLORS='fg:#ebdbb2,bg:#282828,hl:#fb4934,min-height=5'

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${ZDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit
# End of lines added by compinstall

zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{A-Za-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' fzf-flags --height=17
zstyle ':fzf-tab:complete:*' fzf-preview '
if [ -d "$realpath" ]; then
    eza --icons --tree --level=2 --color=always "$realpath"
elif [ -f "$realpath" ]; then
    bat -n --color=always --line-range :500 "$realpath"
fi
'

# Setup alias
# Setup icons for files/folders in terminal
alias ls='eza --icons --color=always'
alias ll='eza --icons --color=always -l'
alias la='eza --icons --color=always -a'
alias lla='eza --icons --color=always -la'
alias lt='eza --icons --color=always -a --tree --level=1'
alias grep='grep --color=always'
alias vim='nvim'
alias cbonsai='cbonsai -l -i -w 1'

# Setup bat (better than cat)
export BAT_THEME="base16"
alias bat='bat --paging=never'

# Setup zoxide (better than cd)
eval "$(zoxide init zsh --cmd cd)"
eval "$(/Users/vinicius/.local/bin/mise activate zsh)"



# fnm
FNM_PATH="/home/vinicius/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/vinicius/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/nvim/bin:$PATH"

# android-sdk
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

export PATH="/home/vinicius/.local/bin:$PATH"

export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/bc/bin:$PATH"

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

function killp(){
    ps aux | fzf --height 40% --layout=reverse --prompt="Select a process to kill: " | awk '{print $2}' | xargs -r sudo kill
}

#
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# bun completions
[ -s "/Users/leleuvilela/.bun/_bun" ] && source "/Users/leleuvilela/.bun/_bun"

# mise
eval "$(~/.local/bin/mise activate zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# keys (not tracked in git — see .zshrc.secrets)
[ -f "$HOME/dotfiles/.zshrc.secrets" ] && source "$HOME/dotfiles/.zshrc.secrets"

# pnpm
export PNPM_HOME="/Users/leleuvilela/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
