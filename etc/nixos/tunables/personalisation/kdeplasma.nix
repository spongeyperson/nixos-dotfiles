# /etc/nixos/tunables/kdeplasma.nix
# KDE Plasma & Dependancies

{
    pkgs,
    user,
    ...
}: {
    services.xserver = {
        # Enable Plasma 5 Desktop Environment.
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;
        # Set Plasma Wayland as Default Session
        displayManager.defaultSession = "plasmawayland";
    };
    environment.systemPackages = with pkgs; [
        # KDE GUI Tools
        kdiff3
        ark
        dolphin
        kate
        okular
        spectacle
        
        # Bluetooth, KDE GUI Dependancies 
        # (see /etc/nixos/global/system/hardware/bluetooth.nix for Non-KDE Bluetooth Dependancies)
        bluedevil
        bluez
        bluez-tools
        libsForQt5.bluez-qt
        libsForQt5.bluedevil

        # KDE System Configuration Modules (KCM)
        libsForQt5.kcmutils
        libsForQt5.sddm-kcm
        libsForQt5.flatpak-kcm

        # KDE Discover / Flatpak Dependancies
        libsForQt5.discover
        packagekit
    ];
}
