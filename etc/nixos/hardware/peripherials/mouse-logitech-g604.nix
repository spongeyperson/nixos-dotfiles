# /etc/nixos/hardware/peripherials/mouse-logitech-g604.nix
# Logitech G604 Mouse

{
    config,
    lib,
    pkgs,
    ...
}: {
    services.ratbagd.enable = true;

    hardware.logitech.wireless = {
        enable = true;
        enableGraphical = true;
    };
    environment.systemPackages = with pkgs; [
        logitech-udev-rules
        solaar
        libratbag
        piper
    ];
}