# /etc/nixos/hardware/bluetooth.nix
#  Bluetooth Hardware Enable

{
    pkgs,
    user,
    ...
}: {
    hardware = {
        bluetooth.enable = true;
        #bluetooth.powerOnBoot = true; - Seems to do opposite of expected result
    };
}