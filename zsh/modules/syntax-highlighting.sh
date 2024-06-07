# $ZSH_MODULES_/syntax-highlighting.sh
#
#########################################

# SYNTAX HIGHLIGHTING
if [ -e "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

echo "-> $(basename $0 .sh) is loaded.."
