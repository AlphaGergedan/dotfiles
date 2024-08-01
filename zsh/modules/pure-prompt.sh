# $ZSH_MODULES_/pure-prompt.sh
#
# nice and lightweight shell prompt
#
#########################################

# PURE prompt setup
fpath+=$HOME/.zsh/pure
autoload -Uz promptinit compinit

# customize prompts
# ideas: ⬆ ➜ ➤ ➩ ⤳  ⤑  ⤇  ⟿ ⟾   ⇮ ⇝  ⇝  ↧  ↥  ↣  🔃 -> <-
# ├─
# ╠═
PURE_PROMPT_SYMBOL=' ↣'
PURE_PROMPT_VICMD_SYMBOL=' ↢'
PURE_GIT_DOWN_ARROW='↧' # PULL
PURE_GIT_UP_ARROW='↥'
PURE_GIT_STASH_SYMBOL='📦'

promptinit
prompt pure

# colors
zstyle ':prompt:pure:git:branch' color 'red'
zstyle ':prompt:pure:virtualenv' color 'cyan'
zstyle ':prompt:pure:git:dirty' color 'cyan'

echo " ➜ $(basename $0 .sh) loaded.."
