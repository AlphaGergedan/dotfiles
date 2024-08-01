# $ZSH_MODULES_/bun.sh
#
# bun setup
#
#########################################

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
path_prepend $BUN_INSTALL/bin

echo " ➜ $(basename $0 .sh) is loaded."
