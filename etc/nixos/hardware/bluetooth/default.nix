# Bluetooth Hardware Enable - /hardware/bluetooth/default.nix

{
    pkgs,
    user,
    ...
}: {
    hardware = {
        bluetooth.enable = true;
    };
}