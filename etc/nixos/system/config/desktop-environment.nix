# /etc/nixos/system/config/desktop-environment.nix
# Desktop Environment Configuration

{
    config,
    lib,
    pkgs,
    ...
}: {
    services.xserver = {
        # Enable the x11 Windowing system (requirement for sddm)
        enable = true;
        # Enable touchpad support (enabled default in most desktopManager).
        libinput.enable = true;

        # Enable Plasma 5 Desktop Environment.
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;
        # Set Plasma Wayland as Default Session
        displayManager.defaultSession = "plasmawayland";
    };
    environment.systemPackages = with pkgs; [
        ## KDE Depends
        ark
        dolphin
        kate
        okular
        spectacle
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