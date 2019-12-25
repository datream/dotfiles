#-----------------------------
# Source some stuff
#-----------------------------
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
  . /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator)
fi

#------------------------------
# Variables
#------------------------------
# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Other Variables
export BROWSER="firefox"
export EDITOR="nvim"

export TERM=xterm-256color
export COLORTERM=truecolor

#------------------------------
# Keybindings
#------------------------------
bindkey -v
typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

#------------------------------
# History stuff
#------------------------------
HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000

#------------------------------
# Alias stuff
#------------------------------
lias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls="lsd --color=auto"
alias sudo="sudo "
alias vim="nvim"

#------------------------------
# Comp stuff
#------------------------------
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
