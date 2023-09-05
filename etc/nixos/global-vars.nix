# Global Variables & Tunables Config - /etc/nixos/global-vars.nix 
# = CHANGE WHAT YOU NEED HERE =
# Changes made in this config 'should' apply globally.

# WARNING: DO NOT DELETE THIS CONFIG. THIS FILE HARDCODED

{ 
    lib,
    config,
    pkgs,
    ... 
}: {
    commonVariables = { 
        hostname = "Spongey-PC"; 

        # DO NOT CHANGE THIS; unless you want a different home dir folder.
        homedir = "/home/tyler";

        username = "tyler";
        #usershell = "pkgs.fish";

        # Locale
        timeZone = "America/Los_Angeles"; # Set time zone.
        Locale = "en_US.UTF-8"; # Select internationalisation properties.

        # Set System Kernel: (./system/boot/grub/default.nix)
        #kernel = "pkgs.linuxPackages_zen";

        # VFIO Settings: (./virtualisation/vfio/default.nix)
        # Use this if you want VFIO.
        # If you don't want VFIO, comment these 2 lines;
        # and comment `./virtualisation` below.
        # OR comment `./vfio` inside `./virtusalisation/default.nix`
        vfioIDs = "10de:2204,10de:1aef";
        vfioBlacklist = "nvidia,nvidiafb,nouveau";
    };

    # Work arounds for `pkgs` strings not being able to be read by `commonVariables`.
    # This is super dumb. I spent over 3 hrs debugging this. Thanks for nothing NixOS
    boot.kernelPackages = pkgs.linuxPackages_zen;
    users = {
        defaultUserShell = pkgs.fish;
        users.tyler.shell = pkgs.fish; 
    };
}
