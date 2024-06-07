# $ZSH_MODULES_/history-substring-search.sh
#
#########################################

# HISTORY SUBSTRING SEARCH
if [ -e "$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
  source "$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh"
  # For fish-like history search plugin. These needs to be bind after syntax highlighting
  bindkey "^K" history-substring-search-up   # CTRL+ALT+k
  bindkey "^J" history-substring-search-down # CTRL+ALT+J
fi

echo "-> $(basename $0 .sh) is loaded.."
