# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # User Configurations
      #./userconf-configs.nix
      #./userconf-declarative.nix
      #<home-manager/nixos>
      #./system-configs.nix

      # WIP VFIO.conf
      #./vfio.nix
    ];

  boot.loader = {
	efi = {
		canTouchEfiVariables = true;
		efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
	};
	grub = {
		enable = true;
		efiSupport = true;
		#efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
		device = "nodev";
		#useOSProber = true;
    };
  };

  # Global Nix Settings:
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
    extraOptions = ''
      min-free = ${toString (100 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
  };

  # Nix Package Manager Configuration:
  nixpkgs.config = {
	# Nix Allow Unfree Packages
	allowUnfree = true;
	
  #Required insecure package for etcher
	#permittedInsecurePackages = [ "electron-12.2.3" ];
  };
  
  # Set Hostname, Use Network Manager:
  networking = {
	hostName = "Spongey-PC";
	networkmanager.enable = true;
  };

  # Set time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Services Configuration:
  services = {
      xserver = {
      # Enable the X11 windowing system.
      enable = true;
      
      # Configure keymap in X11, Internationalisation.
      layout = "us";
      
      # Enable Plasma 5 Desktop Environment.
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      
      # Set Plasma Wayland as Default Session
      displayManager.defaultSession = "plasmawayland";
      
      # Enable touchpad support (enabled default in most desktopManager).
      libinput.enable = true;
    };
  
  # General Services
  openssh.enable = true;
  flatpak.enable = true;
  fstrim.enable = true;
  
  # Virt-Manager Service
  qemuGuest.enable = true;
  
  # Enable CUPS to print documents.
  printing.enable = true;
  
    # Sound Configuration:
    # sound.enable = true;
    # Pulseaudio (Gross)
    # hardware.pulseaudio.enable = true;
    
    # Pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;
    };
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  
  # Vulkan Support

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
    };
    bluetooth = {
      enable = true;
    };
  };

  # Programs Configuration:
  programs = {
    fish.enable = true;
    kdeconnect.enable = true;
    # FIX "GTK themes are not applied in Wayland applications"
    # https://nixos.wiki/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications
    dconf.enable = true;
    mtr = {
      # Enable Program SUID Wrapper Support.
      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      enable = true;
    };
	# Enable GNUPG Agent for Security and SSH Support.
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    tmux = {
      enable = true;
      extraConfig = ''
        set-option -g default-shell /run/current-system/sw/bin/fish
      '';
    };
  };

  # User & User Packages
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.fish;
  users.users.tyler = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "networkmanager" "network" "davfs2" ];
    packages = with pkgs; [
      
      # Temp Theme
      materia-theme
      materia-kde-theme
      
      # Userspace, GUI
      authy
      vlc
      openrgb
      stremio
      
      # Web Browsers
      brave
      librewolf
      chromium
      
      # Chat
      webcord
      telegram-desktop
      
      # Game Streaming Clients
      moonlight-qt
      parsec-bin
      
      # Gaming
      steam
      gamemode
      protonup-qt
      protontricks
      mangohud
      goverlay
      lutris
      bottles
      
      # Userspace, GUI, Unstable Pkgs
      #latte-dock
      
      # Userspace, GUI, noflatpak
      # Versions of Apps that also
      # have flatpak alternativesIf you'd like to turn off all RGB devices supported by OpenRGB, consider something like:
      mailspring
      spotify
      vscode
      barrier
      anydesk
      filelight
      gnome.gnome-calculator
      
      # GUI Audio Manipulation
      pavucontrol
      qpwgraph
      easyeffects
      plasma-pa
      
      # App Images
      appimage-run
      
      # Art
      krita
      
      # Userspace,CLI
      flatpak
      android-tools
      scrcpy
      neofetch
      tree
      jdk8
      jdk17
    ];
  };

  # System Packages
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #environment.shells = with pkgs; [ fish ];
  environment.systemPackages = with pkgs; [
  
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
    
    # Cooling Control
    liquidctl
    
    # KDE Plasma
    ark
    dolphin
    kate
    okular
    spectacle
    
    # Bluetooth
    bluedevil
    bluez
    bluez-tools
    
    # KDE KCM, gui
    libsForQt5.kcmutils
    libsForQt5.sddm-kcm
    libsForQt5.flatpak-kcm
    
    # Encryption Key Management
    gnupg
    
    # make tools, cli
    autoconf
    gcc
    gnumake
    llvm
    libclang
    clang
    cmake
    
    # tools, gui
    gparted
    kdiff3
    
    
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
  ];
  
  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts
    powerline-fonts
    cascadia-code
  ];

  # Virtualisation Toggles, libvirtd, docker, podman
  virtualisation = {
  spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      qemu.runAsRoot = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
    podman = {
      enable = true;
      # Enable compat to use podman as a drop-in replacement for docker.
      #dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

