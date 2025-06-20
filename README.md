
# Overview

Mainly includes config files:

- `/config` for .config
- `/etc` for /etc
- `/ssh` for .ssh
- `/zsh` for .zsh

# NixOS

Set `/etc/nixos/configuration.nix`, `/etc/nixos/flake.nix`, and `/etc/nixos/hardware-configuration.nix`.

Commands:

- `First copy the files listed above.`
- `nix flake init --template github:alphagergedan/dotfiles`
- `nixos-rebuild switch --flake /etc/nixos#nixos`
- `nixos-rebuild test --flake /etc/nixos#nixos`
- Uncomment home-manager settings
- Generate home.nix `nix run home-manager/master -- init && sudo cp ~/.config/home-manager/home.nix /etc/nixos`

For MAN pages:

- `man configuration.nix`
- `man home-configuration.nix`
