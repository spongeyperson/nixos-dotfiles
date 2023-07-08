# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
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

  # Nix Package Manager Configuration
  nixpkgs.config = {
	# Nix Allow Unfree Packages
	allowUnfree = true;
	
	#permittedInsecurePackages = [ "electron-12.2.3" ];
  };
  
  # Set Hostname, Use Network Manager
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
  };

  # Sound Configuration:
  # sound.enable = true;
  # Pulseaudio (Gross)
  # hardware.pulseaudio.enable = true;
  
  # Pipewire
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };
  
  # Vulkan Support
  hardware.opengl = {
	driSupport = true;
	driSupport32Bit = true;
	extraPackages = with pkgs; [
		rocm-opencl-icd
		rocm-opencl-runtime
	];
  };
  
  
  # Programs Configuration:
  programs = {
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
	
	# FIX "GTK themes are not applied in Wayland applications"
	# https://nixos.wiki/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications
	dconf.enable = true;
  };

  # User & User Packages
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tyler = {
    isNormalUser = true;
    extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "networkmanager" "network" "davfs2" ];
    packages = with pkgs; [
    
      # Userspace,GUI
      steam
      authy
      vlc
      kate
      
      # Userspace,GUI,noflatpak
      brave
      firefox
      chromium
      mailspring
      webcord
      spotify
      vscode
      barrier
      anydesk
      filelight
      
      # GUI Audio Manipulation
      pavucontrol
      qpwgraph
      easyeffects
     
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
  environment.systemPackages = with pkgs; [
  
    # editors
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    geany
    
    # Basic Commandline Tools
    wget
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
    
    # virtualisation, qemu
    spice
    docker-compose
    virt-manager
    gnome3.dconf-editor # needed for saving settings in virt-manager
    libguestfs # needed to virt-sparsify qcow2 files
    libvirt
    
    # fsmount,webdav
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

  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
    qemu.runAsRoot = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
  };
  virtualisation.docker = {
	enable = true;
	storageDriver = "btrfs";
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

