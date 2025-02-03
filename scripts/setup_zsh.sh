#!/usr/bin/env bash

ask_question() {
  while true
  do
    read -p "${1} (y/n): " answer
    case "${answer}" in
      [Yy]*) return 0;;
      [Nn]*) return 1;;
      *) echo "Please answer y or n.";;
    esac
  done
}

skip_zsh_setup() {
  echo "Skipping zsh setup..."
  exit 0
}

# Assert that we at root of `dotfiles`
script_dir=$(dirname "$0")
script_name=$(basename "$0")
if [[ "$script_dir" != "scripts" || "$script_name" != "setup_zsh.sh" ]]
then
  echo "Execute the script at the root of \`dotfiles\` using: \`bash ./scripts/setup_zsh.sh\`"
  exit 1
fi

# Setup zsh
if ! ask_question "-> Setup zsh?"
then
  skip_zsh_setup
fi

# the ~/.zsh directory
if [ ! -d "${HOME}/.zsh" ]
then
  if ask_question "-> Create the '${HOME}/.zsh' directory?"
  then
    mkdir "${HOME}/.zsh"
  else
    skip_zsh_setup
  fi
fi

# Pure prompt
if [ ! -d "${HOME}/.zsh/pure" ]
then
  if ask_question "-> Clone pure into '${HOME}/.zsh'?"
  then
    git clone https://github.com/sindresorhus/pure.git $HOME/.zsh/pure
  fi
fi

# zsh-completions
if [ ! -d "${HOME}/.zsh/zsh-completions" ]
then
  if ask_question "-> Clone zsh-completions into '${HOME}/.zsh'?"
  then
    git clone https://github.com/zsh-users/zsh-completions.git $HOME/.zsh/zsh-completions
  fi
fi

# zsh-history-substring-search
if [ ! -d "${HOME}/.zsh/zsh-history-substring-search" ]
then
  if ask_question "-> Clone zsh-history-substring-search into '${HOME}/.zsh'?"
  then
    git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/.zsh/zsh-history-substring-search
  fi
fi

# zsh-syntax-highlighting
if [ ! -d "${HOME}/.zsh/zsh-syntax-highlighting" ]
then
  if ask_question "-> Clone zsh-syntax-highlighting into '${HOME}/.zsh'?"
  then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
  fi
fi

# zshrc
if [ ! -f "${HOME}/.zshrc"  ]
then
  if ask_question "-> Is this a workstation? (hard-links only ws/zshrc into .zshrc if yes)"
  then
    # TODO: hard-link ws/zshrc into $HOME/.zshrc
  else
    # TODO: hard-link zshrc into $HOME/.zshrc
    # TODO: hard-link all the zsh-modules and setup zsh-module system
  fi
fi
