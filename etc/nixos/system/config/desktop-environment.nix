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
}