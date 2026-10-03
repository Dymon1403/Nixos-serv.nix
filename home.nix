{ config, pkgs, ... }:

{
  home.username = "server";
  home.homeDirectory = "/home/server";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch
    htop
    openssh
    curl
    git
    wget
    gcc
    gnumake
    btop
    unzip
    vim
  
  ];


};

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
