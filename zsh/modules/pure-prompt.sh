# $ZSH_MODULES_/pure-prompt.sh
#
# nice and lightweight shell prompt
#
#########################################

# PURE prompt setup
fpath+=$HOME/.zsh/pure
autoload -Uz promptinit compinit

# customize prompts
PURE_PROMPT_SYMBOL='->'
PURE_PROMPT_VICMD_SYMBOL='<-'
PURE_GIT_DOWN_ARROW='PULL'
PURE_GIT_UP_ARROW='PUSH'
PURE_GIT_STASH_SYMBOL='STASH'

promptinit
prompt pure

echo "-> $(basename $0 .sh) loaded.."
