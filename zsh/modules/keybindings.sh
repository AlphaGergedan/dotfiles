# $ZSH_MODULES_/keybindings.sh
#
# term keybindings
#
#########################################

# enable vi mode
bindkey -v

# delete keys
bindkey "^?" backward-delete-char       # Backspace key
bindkey "^U" backward-kill-line         # CTRL-U
bindkey "^W" backward-kill-word         # CTRL-W
bindkey "^[[3~" delete-char             # Delete key

# navigation + yank
bindkey "^Y" yank                       # CTRL-Y
bindkey "^[[C" forward-char             # Right key
bindkey "^[[D" backward-char            # Left key

# navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

echo " ➜ $(basename $0 .sh) is loaded.."
