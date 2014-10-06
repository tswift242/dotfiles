# Enables coloring in prompt
force_color_prompt=yes

# general config
[[ -f ~/.shell/aliases/general ]] && source ~/.shell/aliases/general
[[ -f ~/.shell/aliases/git ]] && source ~/.shell/aliases/git
[[ -f ~/.shell/aliases/maven ]] && source ~/.shell/aliases/maven
[[ -f ~/.shell/aliases/tmux ]] && source ~/.shell/aliases/tmux
[[ -f ~/.shell/variables ]] && source ~/.shell/variables
[[ -f ~/.shell/functions ]] && source ~/.shell/functions
[[ -f ~/.shell/paths ]] && source ~/.shell/paths

# bash specific config
[[ -f ~/.shell/bash/options ]] && source ~/.shell/bash/options
[[ -f ~/.shell/bash/variables ]] && source ~/.shell/bash/variables
[[ -f ~/.shell/bash/prompt ]] && source ~/.shell/bash/prompt

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
