# ~/.zshrc
#
# zsh config file
#
#########################################

# FIXME: automize default modules, put them in a dir
ZSH_MODULES_="$HOME/.zsh/modules"

env_vars_="$ZSH_MODULES_/env-vars.sh"
options_="$ZSH_MODULES_/options.sh"
functions_="$ZSH_MODULES_/functions.sh"
aliases_="$ZSH_MODULES_/aliases.sh"
keybindings_="$ZSH_MODULES_/keybindings.sh"
pure_="$ZSH_MODULES_/pure-prompt.sh"

nvim_="$ZSH_MODULES_/nvim.sh"

completion_="$ZSH_MODULES_/completion.sh"

syntax_highlighting_="$ZSH_MODULES_/syntax-highlighting.sh"
history_substring_search_="$ZSH_MODULES_/history-substring-search.sh"

startup_="$ZSH_MODULES_/startup.sh"

zsh_modules_ls_=($(find $ZSH_MODULES_ -type f))

# default modules to source at startup
loaded_zsh_modules_ls_=($env_vars_ $options_ $aliases_ $functions_ $keybindings_ $pure_ $nvim_ $completion_ $syntax_highlighting_ $history_substring_search_ $startup_)

# source default modules
for mod_ in $loaded_zsh_modules_ls_; do
  test -e "$mod_" && source "$mod_"
done

# set unloaded modules list
unloaded_zsh_modules_ls_=$()
for mod_ in "${zsh_modules_ls_[@]}"; do
  if [[ ! ${loaded_zsh_modules_ls_[@]} =~ "$mod_" ]]; then
    unloaded_zsh_modules_ls_+=($mod_)
  fi
done
