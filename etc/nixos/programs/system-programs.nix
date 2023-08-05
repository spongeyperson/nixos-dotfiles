{
  config,
  lib,
  pkgs,
  ...
}: {
    # System Packages
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    #environment.shells = with pkgs; [ fish ];
    environment = {
        localBinInPath = true;
        systemPackages = with pkgs; [
        # editors
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        geany
        
        # Basic Commandline Tools
        wget
        fuse3
        curl
        zip
        unzip
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
        speedtest-cli
        iperf
        smartmontools
        hwloc
        # Encryption Key Management
        gnupg
        # Watch Replacement
        viddy
        # Cooling Control
        liquidctl
        # Hardware Accel tools, Graphics Testing
        libva-utils
        vdpauinfo
        vulkan-tools
        radeontop
        # CLI, Make Tools
        autoconf
        gcc
        gnumake
        llvm
        libclang
        clang
        cmake



        ## GUI
        openrgb
        fsearch
        sunshine
        # GUI Tools, General
        gparted
        kdiff3
        # GUI Tools, KDE Plasma
        ark
        dolphin
        kate
        okular
        spectacle
        # GUI Tools, KDE Plasma Depends, Bluetooth
        bluedevil
        bluez
        bluez-tools
        libsForQt5.bluez-qt
        libsForQt5.bluedevil
        # GUI Tools, KDE Configuration Modules (KCM), KDE Depends
        libsForQt5.kcmutils
        libsForQt5.sddm-kcm
        libsForQt5.flatpak-kcm
        # GUI Tools, Recording / Editing
        obs-studio
        handbrake


        # Logitech Mouse Control
        libratbag
        piper


        #etcher
        
        # virtualisation hosts, qemu
        spice
        docker-compose
        virt-manager
        dconf
        gnome3.dconf-editor # needed for saving settings in virt-manager
        libguestfs # needed to virt-sparsify qcow2 files
        libvirt

        # Distrobox
        distrobox
        xorg.xhost

        # fsmount, webdav
        davfs2
        autofs5
        fuse
        sshfs
        cadaver

        # Theming, icons
        papirus-icon-theme

        # Theming, system
        materia-theme
        materia-kde-theme

        # Theming, cursor
        apple-cursor
        ];
    };
}