function path_prepend() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH="$1:$PATH"
  fi
}

function path_append() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH="$PATH:$1"
  fi
}
