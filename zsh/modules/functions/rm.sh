function rm() {
  # ensure trash dir exists
  local trash_dir=$HOME/trash
  mkdir -p "$trash_dir"

  # parse args
  local opts=()
  local files=()

  for arg in "$@"; do
    if [[ "$arg" == -* ]]; then
      opts+=($arg)
    else
      files+=($arg)
    fi
  done

  # check if there are files to move
  if [[ ${#files[@]} -eq 0 ]]; then
    echo "rm: missing operand"
    return 1
  fi

  # move each file to the trash dir
  for file in "${files[@]}"; do
    mv -- "$file" "$trash_dir"
  done
}
