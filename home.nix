{ config, lib, pkgs, ... }:

{
  # Read the changelog before changing this value
  home.stateVersion = "23.05";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: true);
  home.pacakges = [
  pkgs.libgourou
  pkgs.git
  pkgs.nixpkgs-fmt
  pkgs.man
  pkgs.vim

  # necessary unzipping
  pkgs.bzip2
  pkgs.gzip
  pkgs.xz
  pkgs.zip
  pkgs.unzip
  pkgs.p7zip
  ];
  # insert home-manager config
}
