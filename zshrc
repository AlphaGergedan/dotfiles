# ~/.zshrc
#
# zsh config file
#
#########################################

# FIXME: automize default modules, put them in a dir
ZSH_MODULES_="$HOME/.zsh/modules"

# common, FIXME: capitalize the names
env_vars_="$ZSH_MODULES_/env-vars.sh"
options_="$ZSH_MODULES_/options.sh"
functions_="$ZSH_MODULES_/functions.sh"
aliases_="$ZSH_MODULES_/aliases.sh"
keybindings_="$ZSH_MODULES_/keybindings.sh"

# terminal prompt
pure_="$ZSH_MODULES_/pure-prompt.sh"
nvim_="$ZSH_MODULES_/nvim.sh"
completion_="$ZSH_MODULES_/completion.sh"
syntax_highlighting_="$ZSH_MODULES_/syntax-highlighting.sh"
history_substring_search_="$ZSH_MODULES_/history-substring-search.sh"

# user-common
npm_="$ZSH_MODULES_/npm.sh"
node_="$ZSH_MODULES_/node.sh"
startup_="$ZSH_MODULES_/startup.sh"

zsh_modules_ls_=($(find $ZSH_MODULES_ -maxdepth 1 -type f))

# default modules to source at startup
loaded_zsh_modules_ls_=(
  # common
  $env_vars_ $options_ $aliases_ $functions_ $keybindings_
  # terminal prompt
  $pure_ $nvim_ $completion_ $syntax_highlighting_ $history_substring_search_
  # npm&node for LSPs
  $npm_ $node_
  # user-common -- define what you would like to setup here
  $startup_
)

# source default modules
for mod_ in $loaded_zsh_modules_ls_
do
  test -e "$mod_" && source "$mod_"
done

# set unloaded modules list
unloaded_zsh_modules_ls_=()
for mod_ in "${zsh_modules_ls_[@]}"
do
  if [[ ! ${loaded_zsh_modules_ls_[@]} =~ "$mod_" ]]
  then
    unloaded_zsh_modules_ls_+=($mod_)
  fi
done
