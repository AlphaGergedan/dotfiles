# $ZSH_MODULES_/go.sh
#
# Go setup
#
#########################################

export GOPATH=$HOME/.local/go
export GOBIN=$GOPATH/bin

path_prepend $GOROOT/bin
path_prepend $GOPATH/bin
path_prepend /usr/local/go/bin

echo " ➜ $(basename $0 .sh) is loaded."
