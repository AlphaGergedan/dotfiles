# $ZSH_MODULES_/nvim/completion.zsh
#
# Zsh completion.
#
#########################################

# automatically find new executables in path
zstyle ':completion:*' rehash true

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache


fpath=($HOME/.zsh/zsh-completions/src $fpath)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=*' 'r:|=*'
compinit
source $HOME/.zsh/zsh-completions/zsh-completions.plugin.zsh

echo "-> $(basename $0 .sh) loaded.."
