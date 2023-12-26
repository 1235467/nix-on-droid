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
    #unrar
    fish
    openssh
    rsync
    ffmpeg
    doas 	
    inputs.nur-custom.legacyPackages.aarch64-linux.jjwxcCrawler
    inputs.nur-custom.legacyPackages.aarch64-linux.ncmdump-rs
    inputs.nur-custom.legacyPackages.aarch64-linux.reflac
    inputs.nur-custom.legacyPackages.aarch64-linux.DownOnSpot
    inputs.nur-custom.legacyPackages.aarch64-linux.BBDown
    
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
    #"nixbuild.net/nixbuild-1:RTmcV6NzBWCJgfq5rxZigu12jz0HZf18uh0wh/dL4O0="
    #"numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
    #"nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    #"hakutaku-cache.cachix.org-1:xO0APxxyhJqmN29tIEBuqjhbrx3UIYxMfZ70SY6RuVo="
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
