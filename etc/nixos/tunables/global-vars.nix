# /etc/nixos/tunables/global-vars.nix
# Global Variables & Tunables Config

# = CHANGE WHAT YOU NEED HERE =
# Changes made in this config 'should' apply globally.

# WARNING: DO NOT DELETE THIS CONFIG. THIS FILE IS HARDCODED

{ 
    lib,
    config,
    pkgs,
    ... 
}: {
    systemVariables = {

        # Only Type "amd" or "intel".
        # This changes IOMMU enablement / cpu microcode settings
        cputype = "amd";

        # Only Type "amdgpu" or "nvidia".
        # This changes XServer / Wayland default driver
        gputype = "amdgpu";

        # Set System Kernel:
        kernel = pkgs.linuxPackages_zen;

        # VFIO Settings: (./hardware-specific/vfio)
        # Use this if you want VFIO.
        # If you don't want VFIO, comment these 2 lines;
        # and comment `./virtualisation` below.
        # OR comment `./vfio` inside `./virtusalisation/default.nix`
        vfioIDs = "1002:73df,1002:ab28";
        vfioBlacklist = "nvidia,nvidiafb,nouveau";

        # System Hostname
        hostname = "Spongey-ROG";
        # Fully Qualified (Local) Domain Name
        fqdn = "Spongey-ROG.lan";
    };
    userVariables = {

        # DO NOT CHANGE THIS; unless you want a different home dir folder.
        homedir = "/home/tyler";

        # User
        username = "tyler";
        usershell = pkgs.fish;
        userid = 1000;

        # Locale / Localisation
        timeZone = "America/Los_Angeles"; # Set time zone.
        Locale = "en_US.UTF-8"; # Select internationalisation properties.
        keymap = "us";
    };
}
