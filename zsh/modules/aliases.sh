# $ZSH_MODULES_/aliases.sh
#
# shell aliases
#
#########################################

alias ls='ls --color=auto'                                  # nice colorings
alias l='ls -F --group-directories-first'
alias ll="l -lah"                                           # human readable, dereference, list all

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias rg='grep --colour=auto'

alias cp="cp -i"                                            # confirm before overwriting something
#alias rm='rm -i'                                            # confirm before deleting
alias df='df -h'                                            # human-readable sizes
alias free='free -m'                                        # show sizes in MB

alias more='nvim -R'
alias o='nvim -R'
alias less='nvim -R'

# navigation
alias ..="cd ../"
alias ...="cd ../../"
alias cd..="cd .."

# memory
alias usage="du -hd 1"                                      # memory usage in the current dir

alias show="whence"                                         # binary location of a command

# Compilation paths
alias include-path-c="echo | gcc -x c -E -Wp,-v - >/dev/null"
alias include-path-cpp="echo | gcc -x c++ -E -Wp,-v - >/dev/null"

# Git aliases
#alias gitu='git add . && git commit && git push'
alias g='git'

# set a random background image
alias bg-random='nitrogen --set-zoom-fill --save --random $HOME/repos/github/wallpapers'
alias bg-set='nitrogen --set-zoom-fill --save'

# cpu info
alias cpuinfo="grep 'cpu MHz' /proc/cpuinfo"
alias cpu-available-frequencies='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_frequencies'
alias cpu-available-governos='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors'

# ubuntu system update
alias update='sudo apt-get update && sudo apt-get upgrade'

# docker aliases
alias dcr='docker compose run'

# jst docker-compose
#alias docker-compose-jst='sudo docker-compose down && sudo docker-compose build && sudo docker-compose up -d && sudo docker-compose logs -f -t'

#alias library-search-ld="echo 'ld --verbose | grep SEARCH_DIR | tr -s \' ;\' \\\\012' "
#alias library-path-gcc="gcc -print-search-dirs | sed '/^lib/b 1;d;:1;s,/[^/.][^/]*/\.\./,/,;t 1;s,:[^=]*=,:;,;s,;,;  ,g' | tr \; \\012 | tr : \\012"

#-------------------------------------------------------------------------------

# fan control
alias fan-turbo="sudo sh -c 'echo 1 >> /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy'"
alias fan-perf="sudo sh -c 'echo 0 >> /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy'"
alias fan-silent="sudo sh -c 'echo 2 >> /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy'"

# battery control
alias bat-stat="cat /sys/class/power_supply/BAT0/status"
alias bat-perc="cat /sys/class/power_supply/BAT0/capacity"

# tmux with conf
alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"

alias path="echo $PATH"

echo "-> $(basename $0 .sh) is loaded.."
