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
        xserver = {
            # Enable the x11 Windowing system (requirement for sddm)
            enable = true;
            # Enable touchpad support (enabled default in most desktopManager).
            libinput.enable = true;
            displayManager = {
                # Enable SDDM
                sddm.enable = true;
                # Set SDDM to Wayland Mode
                sddm.wayland.enable = true;
                # Set SDDM Default Session to Plasma Wayland
                defaultSession = "plasma";
            };
        };
    };
    environment.systemPackages = with pkgs; [
        ## KDE Depends
        ark
        dolphin
        ## KDE-Specific Applications
        kate
        okular
        spectacle
        libsForQt5.merkuro # Merkuro (Kalendar)
        # GUI Tools, KDE Configuration Modules (KCM), KDE Depends
        libsForQt5.kcmutils
        libsForQt5.sddm-kcm
        libsForQt5.flatpak-kcm
        # Misc Libs for QT5, KDE Discover
        libsForQt5.discover
        packagekit
        # Tiling Window Manager
        libsForQt5.bismuth
    ];
}