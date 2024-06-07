# $ZSH_MODULES_/options.sh
#
# zsh options
#
#########################################

# if only directory path is entered, cd there.
setopt AUTO_CD

# Sort filenames numerically when it makes sense
setopt NUMERIC_GLOB_SORT

# Immediately append history instead of overwriting
setopt APPEND_HISTORY

# save commands are added to the history immediately, otherwise only when shell exits.
setopt INC_APPEND_HISTORY

setopt EXTENDED_HISTORY

# do not list duplicates when listing
setopt HIST_FIND_NO_DUPS

# do not save duplicate commands at all
setopt HIST_IGNORE_ALL_DUPS

echo "-> $(basename $0 .sh) is loaded."
