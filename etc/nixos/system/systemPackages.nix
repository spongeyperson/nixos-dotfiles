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
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        micro
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


        file
        htop
        btop
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
        gnupg # Encryption Key Management
        viddy # Watch Replacement
        # CLI - GCC MAKE Tools
        autoconf
        gcc
        gnumake
        llvm
        libclang
        clang
        cmake


        ## Hardware Control, CLI
        ## Moved to /etc/nixos/system/config/programs/liquidctl.nix
        #unstable.liquidctl     # Liquid Cooling Control
        lm_sensors    # ACPI Sensors Control
        corectrl      # AMDGPU Tuning
        lact          # Alternative to corectrl

        ## Hardware Control, GUI
        ## Moved to /etc/nixos/system/config/programs/openrgb.nix
        #openrgb       # RGB Control


        # GPU Hardware Accel Tools / Graphics Testing
        libva-utils
        vdpauinfo
        vulkan-tools
        radeontop


        ## GUI
        xwaylandvideobridge
        fsearch
        gparted
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


        ## THEMING
        materia-theme
        materia-kde-theme
        # Theming, icons
        papirus-icon-theme
        # Theming, cursor
        apple-cursor
    ];
  };
}
