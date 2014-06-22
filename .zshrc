# emacs key bindings
bindkey -e

# vim key bindings
#bindkey -v
#bindkey '\e[3~' delete-char
#bindkey '^R' history-incremental-search-backward

# load prompt colors
autoload -U colors && colors

# enhanced auto completion
autoload -U compinit && compinit
zmodload -i zsh/complist

# version control info for prompt
autoload -Uz vcs_info

# general config
[[ -f ~/.shell/aliases/general ]] && source ~/.shell/aliases/general
[[ -f ~/.shell/aliases/git ]] && source ~/.shell/aliases/git
[[ -f ~/.shell/aliases/maven ]] && source ~/.shell/aliases/maven
[[ -f ~/.shell/variables ]] && source ~/.shell/variables
[[ -f ~/.shell/functions ]] && source ~/.shell/functions
[[ -f ~/.shell/paths ]] && source ~/.shell/paths

# zsh specific config
[[ -f ~/.shell/zsh/variables ]] && source ~/.shell/zsh/variables
[[ -f ~/.shell/zsh/options ]] && source ~/.shell/zsh/options
[[ -f ~/.shell/zsh/prompt ]] && source ~/.shell/zsh/prompt

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
