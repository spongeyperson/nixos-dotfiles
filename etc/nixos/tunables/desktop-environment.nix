# /etc/nixos/tunables/desktop-environment.nix

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
}
