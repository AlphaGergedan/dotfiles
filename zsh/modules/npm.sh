# $ZSH_MODULES_/npm.sh

#npm set prefix ~/.local/npm
#PATH="$HOME/.local/npm/bin:$PATH"
#
#PATH="/.node_modules/.bin:$PATH"
#PATH="$HOME/.local/node_modules/.bin:$PATH"
#

# For n managing node versions
export N_PREFIX=$HOME/.local

export NVM_DIR="$HOME/.local/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# wasm
#export NODE_OPTIONS="--openssl-legacy-provider"

echo "-> $(basename $0 .sh) is loaded.."
