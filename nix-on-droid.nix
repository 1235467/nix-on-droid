{ config, lib, pkgs, inputs, ... }:

{
  environment.packages = with pkgs; [
# or some other editor, e.g. nano or neovim
#     diffutils
#     findutils
#     utillinux
#     tzdata
#     hostname
#     gnugrep
#     gnupg
#     gnused
#     gnutar
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
    fish
    openssh
    rsync
    inputs.nur-custom.legacyPackages.aarch64-linux.jjwxcCrawler
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
