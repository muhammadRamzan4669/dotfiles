# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::archlinux

autoload -Uz compinit && compinit
zinit cdreplay -q

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Accept autosuggestion up to next / or full if no /
_accept_to_slash() {
  if [[ -n "$POSTDISPLAY" ]]; then
    if [[ "$POSTDISPLAY" == */* ]]; then
      local prefix="${POSTDISPLAY%%/*}"
      local n=$(( ${#prefix} + 1 ))
      BUFFER="${BUFFER}${POSTDISPLAY:0:$n}"
      POSTDISPLAY="${POSTDISPLAY:$n}"
      CURSOR=${#BUFFER}
    else
      BUFFER="${BUFFER}${POSTDISPLAY}"
      POSTDISPLAY=""
      CURSOR=${#BUFFER}
    fi
    region_highlight=("${#BUFFER} $(( ${#BUFFER} + ${#POSTDISPLAY} )) ${ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE:-fg=8}")
  else
    zle forward-char
  fi
}
zle -N _accept_to_slash
bindkey '^f' _accept_to_slash

WORDCHARS=${WORDCHARS//\/}

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias z='zeditor'
alias sz='sudoedit'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export EDITOR="zeditor"
