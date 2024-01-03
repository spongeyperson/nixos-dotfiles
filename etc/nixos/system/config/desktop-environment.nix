# /etc/nixos/system/config/desktop-environment.nix
# Desktop Environment Configuration

{
    config,
    lib,
    pkgs,
    ...
}: {
    services.xserver = {
        # Enable Plasma 5 Desktop Environment.
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;
        # Set Plasma Wayland as Default Session
        displayManager.defaultSession = "plasmawayland";
    };
}