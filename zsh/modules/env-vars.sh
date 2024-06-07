# $ZSH_MODULES_/env-vars.sh
#
# environment variables to create at start
# variables related to any other stack should
# be included in their own module files
#
#########################################

# editor
export VISUAL='nvim'
export EDITOR='nvim'

# these are exactly the chars that are deleted after killword command
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# zhistory
export HISTFILE=~/.zsh/zhistory
export HISTFILESIZE=10000000
export HISTSIZE=10000000
export HISTTIMEFORMAT="[%F %T] "
export SAVEHIST=10000000

echo "-> $(basename $0 .sh) is loaded."
