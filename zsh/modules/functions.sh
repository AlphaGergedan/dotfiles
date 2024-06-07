# $ZSH_MODULES_/functions
#
# useful functions for shell
#
#########################################

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Set terminal window and tab/icon title
#
# usage: title short_tab_title [long_window_title]
#
# See: http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
# Fully supports screen and probably most modern xterm and rxvt
# (In screen, only short_tab_title is used)
function title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return

  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}

  case "$TERM" in
    xterm*|putty*|rxvt*|konsole*|ansi|mlterm*|alacritty|st*)
      print -Pn "\e]2;${2:q}\a" # set window name
      print -Pn "\e]1;${1:q}\a" # set tab name
      ;;
    screen*|tmux*)
      print -Pn "\ek${1:q}\e\\" # set screen hardstatus
      ;;
    *)
    # Try to use terminfo to set the title
    # If the feature is available set title
    if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
      echoti tsl
      print -Pn "$1"
      echoti fsl
    fi
      ;;
  esac
}

# Runs before executing the command
function mzc_termsupport_preexec {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return

  emulate -L zsh

  # split command into array of arguments
  local -a cmdargs
  cmdargs=("${(z)2}")
  # if running fg, extract the command from the job description
  if [[ "${cmdargs[1]}" = fg ]]; then
    # get the job id from the first argument passed to the fg command
    local job_id jobspec="${cmdargs[2]#%}"
    # logic based on jobs arguments:
    # http://zsh.sourceforge.net/Doc/Release/Jobs-_0026-Signals.html#Jobs
    # https://www.zsh.org/mla/users/2007/msg00704.html
    case "$jobspec" in
      <->) # %number argument:
        # use the same <number> passed as an argument
        job_id=${jobspec} ;;
      ""|%|+) # empty, %% or %+ argument:
        # use the current job, which appears with a + in $jobstates:
        # suspended:+:5071=suspended (tty output)
        job_id=${(k)jobstates[(r)*:+:*]} ;;
      -) # %- argument:
        # use the previous job, which appears with a - in $jobstates:
        # suspended:-:6493=suspended (signal)
        job_id=${(k)jobstates[(r)*:-:*]} ;;
      [?]*) # %?string argument:
        # use $jobtexts to match for a job whose command *contains* <string>
        job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]} ;;
      *) # %string argument:
        # use $jobtexts to match for a job whose command *starts with* <string>
        job_id=${(k)jobtexts[(r)${(Q)jobspec}*]} ;;
    esac

    # override preexec function arguments with job command
    if [[ -n "${jobtexts[$job_id]}" ]]; then
      1="${jobtexts[$job_id]}"
      2="${jobtexts[$job_id]}"
    fi
  fi

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title '$CMD' '%100>...>$LINE%<<'
}

# Runs before showing the prompt
function mzc_termsupport_precmd {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

# tests the time of zshell
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do time $shell -i -c exit; done
}

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

# yazi -- file manager tui
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
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

# lists
function ls-zsh-modules() {
  print_separator "Available ZSH Modules"
  echo "$zsh_modules_ls_"
  print_separator
}

function confirm_cmd() {
  # TODO
}

# to avoid duplicate paths provide the following functions

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

function rm() {
  # ensure trash dir exists
  local trash_dir=$HOME/trash
  mkdir -p "$trash_dir"

  # parse args
  local opts=()
  local files=()

  for arg in "$@"; {
    if [[ "$arg" == -* ]]; then
      opts+=($arg)
    else
      files+=($arg)
    fi
  }

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

echo "-> $(basename $0 .sh) is loaded.."
