{ config, pkgs, ... };

{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."lskdjfkl".device = "/dev/disk/by-uuid/29487328479";
  networking.hostName = "gergedan";
  networking.networkManager = true;
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LS_IDENTIFICATION = "de_DE.UTF-8";
    LS_MEASUREMENT = "de_DE.UTF-8";
    ...
  };

  # X Server

  # CUPS

  users.users.atamert = {
    ...
    packages = with pkgs; [
      kitty
      neovim vscode
      nemo
      zathura sxiv vlc
      gnome-disk-utility
      brave discord spotify
    ];
  };
  nixpgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget git cmake libgcc
  ];
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  system.stateVersion = "25.05";
}
