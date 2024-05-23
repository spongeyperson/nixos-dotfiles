# /etc/nixos/hardware/peripherials/wheel-logitech-g29.nix
# Logitech G29 Racing Wheel

{
    config,
    lib,
    pkgs,
    ...
}: {
    environment.systemPackages = with pkgs; [
        oversteer
    ];
}