# $ZSH_MODULES_/ruby.sh
#
# ruby setup
#
#########################################

# ruby version manager
path_append $HOME/.rvm/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

echo "-> $(basename $0 .sh) is loaded."
