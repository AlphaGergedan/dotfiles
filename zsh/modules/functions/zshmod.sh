function ls-zsh-modules() {
  print_separator "Available ZSH Modules"
  echo "$zsh_modules_ls_"
  print_separator
}

function zshmod() {
  local usage="Usage: zshmod {list|load|unload} [module-name]"

  if [[ $# -eq 0 ]]; then
    echo $usage
    return 1
  fi

  local command=$1
  case "$command" in
    list)
      print_separator "Unloaded ZSH Modules"
      echo "\n$unloaded_zsh_modules_ls_\n"
      print_separator "Loaded ZSH Modules"
      echo "\n$loaded_zsh_modules_ls_\n"
      print_separator
      ;;
    load)
      if [[ -z "$2" ]]; then
        echo "Module name missing"
        echo $usage
        return 1
      fi

      if [[ ${loaded_zsh_modules_ls_[@]} =~ "$2" ]]; then
        echo "Module $2 already loaded"
        return 0
      fi

      if [[ ! ${zsh_modules_ls_[@]} =~ ${2} ]]; then
        echo "Module $2 not found"
        return 1
      fi

      local file="$ZSH_MODULES_/$2.sh"
      source $file
      loaded_zsh_modules_ls_+=($file)

      local tmp=()
      # remove the element from unloaded list
      for mod_ in "${unloaded_zsh_modules_ls_[@]}"; do
        if [[ "$mod_" != "$file" ]]; then
          tmp+=("$mod_")
        fi
      done

      unloaded_zsh_modules_ls_=$tmp

      echo "Module $2 loaded"
      return 0
      ;;
    unload)
      # TODO: unload the given module and fix the loaded unloaded modules list
      echo "Not implemented yet."
      return 1
      ;;
    *)
      echo "Unknown command: $command"
      echo $usage
      return 1
      ;;

  esac
}
