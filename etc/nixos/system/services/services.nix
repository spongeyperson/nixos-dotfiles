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
        fstrim.enable = true;
        teamviewer.enable = true;

        # Enable CUPS to print documents.
        printing.enable = true;

        # Flatpak
        flatpak.enable = true;
        # Package Kit, Flatpak Dependancy
        packagekit.enable = true;

        # # Libratbag
        # ratbagd.enable = true; - Disabled because it's been moved to /etc/nixos/hardware/peripherials/mouse-logitech-g604.nix
    };
}