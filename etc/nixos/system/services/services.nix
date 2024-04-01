# /etc/nixos/system/services/services.nix
# System Services Config

{
    config,
    lib,
    pkgs,
    ...
}: {
    # General Services Configuration where they cannot go elsewhere:
    services = {
        openssh.enable = true;
        flatpak.enable = true;
        fstrim.enable = true;
        teamviewer.enable = true;

        # Enable CUPS to print documents.
        printing.enable = true;
        
        # Package Kit
        packagekit.enable = true;
        # Libratbag
        ratbagd.enable = true;

        xserver = {
            # Enable the X11 windowing system.
            enable = true;
            # Enable touchpad support (enabled default in most desktopManager).
            libinput.enable = true;
        };
    };
}