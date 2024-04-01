{ config, lib, pkgs, inputs, ... }:
let
  nurpkg = inputs.nur-custom.legacyPackages.aarch64-linux;
in
{
  environment.packages = with pkgs; [
    libgourou
    git
    nixpkgs-fmt
    man
    vim

    # necessary unzipping
    bzip2
    gzip
    xz
    zip
    unzip
    p7zip
    #unrar
    fish
    openssh
    rsync
    ffmpeg
    doas
    nodejs
    wget 	
    nurpkg.jjwxcCrawler
    nurpkg.ncmdump-rs
    nurpkg.reflac
    nurpkg.DownOnSpot
    nurpkg.BBDown
    nurpkg.koboldcpp
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nix.substituters = ["https://cache.nixos.org" "https://cache.garnix.io" ];
  nix.trustedPublicKeys = [
    "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];
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
