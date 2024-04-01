# /etc/nixos/hardware/bluetooth.nix
#  Bluetooth Hardware Enable

{
    pkgs,
    user,
    ...
}: {
    hardware = {
        bluetooth.enable = true;
    };
}