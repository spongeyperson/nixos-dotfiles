# /etc/nixos/system/systemPackages.nix
# General System Packages Configuration

{
  config,
  lib,
  pkgs,
  ...
}: {
  # Allow Unstable Repo for Specific Packages: 
  nixpkgs.config = {
    packageOverrides = pkgs: with pkgs; {
      unstable = import <unstable> {};
    };
  };
  # System Font Package Config
  fonts.packages = with pkgs; [
      nerdfonts
      powerline-fonts
      cascadia-code
  ];

  # Permitted Insecure Packages, moved to /etc/nixos/system/config/nixconfig.nix

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #environment.shells = with pkgs; [ fish ];
  environment = {
    localBinInPath = true;
    systemPackages = with pkgs; [
      # Packages with Insecure Package Requirements
      etcher

      # Text Editors - CLI
      vim
      nano

      # Text Editors - GUI
      geany

      # Basic Commandline Tools
      wget
      fuse3
      curl

      # Archive Management
      zip
      unzip
      rar
      unrar

      # System Tools
      file
      tmux
      git
      man
      lshw
      lsof
      rsync
      zsync
      rclone
      ffmpeg
      ncurses5
      coreutils
      binutils
      pciutils
      usbutils
      dmidecode
      tree
      whois
      killall
      gpm
      speedtest-cli
      iperf
      smartmontools
      hwloc
      mkpasswd
      gnupg
      viddy
      fzf
      atuin
      du-dust
      bat
      eza
      gamescope

      # GCC MAKE Tools
      autoconf
      gcc
      gnumake
      llvm
      libclang
      clang
      cmake

      # Hardware Control, CLI
      lm_sensors
      corectrl
      lact

      # GPU Hardware Accel Tools / Graphics Testing
      libva-utils
      vdpauinfo
      vulkan-tools
      radeontop

      # GUI
      xwaylandvideobridge
      fsearch
      gparted
      gnome.gnome-disk-utility
      kdiff3
      qdirstat

      # GUI Tools, Recording / Editing
      obs-studio
      handbrake
      sonobus

      # GUI - Remote Desktop Hosts, Etc.
      sunshine
      waynergy
      wl-clipboard

      # Theming
      materia-theme
      materia-kde-theme

      # Theming, icons
      papirus-icon-theme

      # Theming, cursor
      apple-cursor

      # Top Programs
      htop
      btop
      powertop
      iotop

      okteta
    ];
  };
}
