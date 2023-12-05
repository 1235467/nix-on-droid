{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    vim # or some other editor, e.g. nano or neovim
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    fish
    nixpkgs-fmt
    libgourou
    openssh
    rsync
    git
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    
  '';

  # Set your time zone
  time.timeZone = "China/Shanghai";
  user.shell = "${pkgs.fish}/bin/fish";

  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };
}

# vim: ft=nix
