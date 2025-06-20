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

export LESS_TERMCAP_mb=$'\e[1;31m'  # Begin blinking
export LESS_TERMCAP_md=$'\e[1;31m'  # Begin bold
export LESS_TERMCAP_me=$'\e[0m'     # End mode
export LESS_TERMCAP_se=$'\e[0m'     # End standout-mode
export LESS_TERMCAP_so=$'\e[01;44;33m'  # Begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'     # End underline
export LESS_TERMCAP_us=$'\e[1;32m'  # Begin underline
export TERM=xterm-256color
export COLORTERM=truecolor

export OLLAMA_MODELS="/home/gergedan/ssd/SanDisk/ollama/data/models"

# tmux override
if [ -n "$TMUX" ]
then
  export TERM="tmux-256color"
fi

echo " ➜ $(basename $0 .sh) is loaded."
