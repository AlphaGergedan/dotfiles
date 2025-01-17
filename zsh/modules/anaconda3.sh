# $ZSH_MODULES_/anaconda3.sh
#
# conda setup
#
#########################################

__conda_setup="$('$HOME/.local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/.local/miniconda3/etc/profile.d/conda.sh"
    else
        path_prepend $HOME/.local/miniconda3/bin
    fi
fi
unset __conda_setup

# fastapi completion
autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# enable base conda and evaluate completion
#conda activate
#eval "$(register-python-argcomplete conda)"

echo " ➜ $(basename $0 .sh) is loaded."
