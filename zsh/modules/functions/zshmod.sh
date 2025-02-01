
function zshmod() {
  local usage="Usage: zshmod {list|load} [module-name]"

  if [[ $# -eq 0 ]]; then
    echo $usage
    return 1
  fi

  local command=$1
  case "$command" in
    list)
      print_separator "Loaded ZSH Modules"
      basename -s .sh -a ${loaded_zsh_modules_ls_} | sort
      print_separator "Unloaded ZSH Modules"
      basename -s .sh -a ${unloaded_zsh_modules_ls_} | sort
      print_separator
      ;;
    load)
      if [[ -z "$2" ]]; then
        echo "Module name missing"
        echo $usage
        return 1
      fi

      # Check if inside loaded modules
      for _mod in "${loaded_zsh_modules_ls_[@]}"
      do
        local _mod_base=$(basename -s .sh $_mod)
        if [[ $_mod_base == $2 ]]
        then
          echo "Module $2 already loaded"
          return 0
        fi
      done

      for _mod in "${zsh_modules_ls_[@]}"
      do
        local _mod_base=$(basename -s .sh $_mod)
        if [[ $_mod_base == $2 ]]
        then
          local _to_load=$ZSH_MODULES_/$2.sh
          # load the found module
          source $_to_load
          loaded_zsh_modules_ls_+=($_to_load)

          local new_list=$()
          for _unloaded_mod in "${unloaded_zsh_modules_ls_[@]}"
          do
            if [[ "$_unloaded_mod" == "$_to_load" ]]
            then
              continue
            fi
            new_list+=($_unloaded_mod)
          done
          unloaded_zsh_modules_ls_=(${new_list[@]})
          return 0
        fi
      done

      echo "Module $2 not found"
      return 1
      ;;
    *)
      echo $usage
      return 1
      ;;
  esac
}

