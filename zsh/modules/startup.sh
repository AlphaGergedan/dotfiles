# $ZSH_MODULES_/nvim/startup.sh
#
# postinit shell script
#
#########################################

# key pressing rates, the sweet spot
xset r rate 150 50

# fix scrolling to be in the right direction
#eval "xinput set-button-map $(xinput list | grep Touchpad | sed -e 's/^.*id=//' -e 's/\s.*$//') 1 2 3 5 4 6 7"
#eval "xinput set-button-map $(xinput list | grep SteelSeries | sed -e 's/^.*id=//' -e 's/\s.*$//') 1 2 3 5 4 6 7"

# see user packages first
path_prepend $HOME/.local/bin

load anaconda3
conda activate ml

load rust


echo " ➜ $(basename $0 .sh) loaded.."
