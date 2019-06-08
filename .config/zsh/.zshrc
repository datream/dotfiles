#---------------------------------------------------------------------------#
# File:     .zshrc   ZSH resource file                                      #
# Version:  0.1.16                                                          #
# Original Author:   Øyvind "Mr.Elendig" Heggstad <mrelendig@har-ikkje.net> #
# Aurthor:  Datream Sailo Tanti
#---------------------------------------------------------------------------#

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

#-----------------------------
# Dircolors
#-----------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

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
HISTFILE="$XDG_CONFIG_HOME/zsh/.histfile"
HISTSIZE=1000
SAVEHIST=1000

#------------------------------
# Alias stuff
#------------------------------
alias ls="lsd"
alias sudo="sudo "
alias vim="nvim"

#------------------------------
# Comp stuff
#------------------------------
autoload -Uz compinit
compinit

setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
