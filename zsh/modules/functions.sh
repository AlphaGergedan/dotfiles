# $ZSH_MODULES_/functions
#
# useful functions for shell
#
#########################################

# source all the .sh files in the directory ~/.zsh/modules/functions
zsh_functions_ls_=($(find "$ZSH_MODULES_/functions" -type f -name "*.sh"))
for function_ in "${zsh_functions_ls_[@]}"
do
  test -e "${function_}" && source "${function_}"
done

# memory usage of a process
mem_pid() {
  ps -p $1 -o rss | tail -n 1 | awk '{print $1/1024/1024 " GB"}'
}
mem_name() {
  ps aux | grep $1 | grep -v grep | awk '{print $6/1024/1024 " GB"}'
}

watch_mem_pid() {
    watch -n $2 "ps -p $1 -o rss | tail -n 1 | awk '{print \$1/1024/1024 \" GB\"}'"
}
watch_mem_name() {
    watch -n $2 "ps aux | grep $1 | grep -v grep | awk '{print \$6/1024/1024 \" GB\"}'"
}

git-large-files() {
  while read -r largefile; do
    echo $largefile | awk '{printf "%s %s ", $1, $3 ; system("git rev-list --all --objects | grep " $1 " | cut -d \" \" -f 2-")}'
      done <<< "$(git rev-list --all --objects | awk '{print $1}' | git cat-file --batch-check | sort -k3nr | head -n 20)"
}

# accepts one str to place in the middle of the separator
function print_separator() {
  local cols=$(tput cols)
  local separator=$(printf -- "-%.0s" $(seq 1 $cols))
  if [ "$1" ]; then
    # put spaced around the word for pretty print
    local str=" $1 "
  fi
  local str_len=$(( ${#str} + 2 ))
  local str_pos=$(( (cols - str_len) / 2 ))
  printf -- "%s" "${separator:0:$str_pos}"
  printf -- "%s" "$str"
  printf -- "%s\n" "${separator:$str_pos+$str_len}"
}

function confirm_cmd() {
  # TODO
}

# to avoid duplicate paths provide the following functions

# checking sha
#function checksha() {
  #local filepath="$1"
  #cat $filepath | sha256sum --check --status
#}

# TODO: for ghost script pdf compression
# gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=OUT.pdf IN.pdf

echo " ➜ $(basename $0 .sh) is loaded.."
