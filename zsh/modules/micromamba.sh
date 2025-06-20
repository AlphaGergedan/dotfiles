# $ZSH_MODULES_/micromamba.sh
#
# micromamba setup for python
#
#########################################

# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/gergedan/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/gergedan/ssd/SanDisk/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup

echo " ➜ $(basename $0 .sh) is loaded."

