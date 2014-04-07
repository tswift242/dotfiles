### Shell Options ###
# Use case-insensitive filename globbing
shopt -s nocaseglob
# Append to history instead of overwriting
shopt -s histappend
# When changing directory small typos can be ignored by bash
shopt -s cdspell

[[ -f ~/.bash/aliases/general ]] && source ~/.bash/aliases/general
[[ -f ~/.bash/aliases/git ]] && source ~/.bash/aliases/git
[[ -f ~/.bash/aliases/maven ]] && source ~/.bash/aliases/maven
[[ -f ~/.bash/exports ]] && source ~/.bash/exports
[[ -f ~/.bash/functions ]] && source ~/.bash/functions
[[ -f ~/.bash/paths ]] && source ~/.bash/paths

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
