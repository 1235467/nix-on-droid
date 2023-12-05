{ config, lib, pkgs, ... }:

{
  # Read the changelog before changing this value
  home.stateVersion = "23.05";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  # insert home-manager config
}
