{ 
    lib,
    config,
    pkgs,
    ... 
}: {
    commonVariables = { 
        hostname = "Spongey-PC"; 

        # DO NOT CHANGE THIS; unless you want a different home dir folder.
        homedir = "/home/${config.commonVariables.username}";

        username = "tyler";
        #usershell = "pkgs.fish";

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
    boot.kernelPackages = pkgs.linuxPackages_zen;
    users.defaultUserShell = pkgs.fish;
    users.users.${config.commonVariables.username}.shell = pkgs.fish;
}
