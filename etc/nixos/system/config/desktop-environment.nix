# /etc/nixos/system/config/desktop-environment.nix
# Desktop Environment Configuration

{
    config,
    lib,
    pkgs,
    ...
}: {
    services = {
        # Enable Plasma 6
        desktopManager.plasma6.enable = true;
        libinput.enable = true;
        displayManager = {
            # Enable SDDM
            sddm.enable = true;
            # Set SDDM to Wayland Mode
            sddm.wayland.enable = true;
            # Set SDDM Default Session to Plasma Wayland
            defaultSession = "plasma";
        };
        xserver = {
            # Enable the x11 Windowing system (requirement for sddm)
            enable = true;
            # Enable touchpad support (enabled default in most desktopManager).
        };
    };
    #nixpkgs.config.allowBroken = true; # Enabled for Kmix as it's labelled as "broken"
    environment.systemPackages = with pkgs; [
        # Audio Dependancies
        #kdePackages.kmix #- Marked Broken, according to build.

        ## KDE Depends
        kdePackages.ark
        kdePackages.dolphin
        ## KDE-Specific Applications
        kdePackages.kate
        kdePackages.okular
        kdePackages.spectacle
        kdePackages.merkuro # Merkuro (Kalendar)
        kdePackages.kmail # Merkuro Mail
        kdePackages.kmail-account-wizard # Merkuro Mail Depends
        kdePackages.kmailtransport
        # GUI Tools, KDE Configuration Modules (KCM), KDE Depends
        kdePackages.kcmutils
        kdePackages.sddm-kcm
        kdePackages.flatpak-kcm
        # Misc Libs for QT5, KDE Discover
        kdePackages.discover
        packagekit
        # Tiling Window Manager
        #libsForQt5.bismuth
    ];
}