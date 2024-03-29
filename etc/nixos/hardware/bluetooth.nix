# /etc/nixos/hardware/bluetooth.nix
#  Bluetooth Hardware Enable

{
    pkgs,
    user,
    ...
}: {
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings = {
            General = {
            Enable = "Source,Sink,Media,Socket";
            };
        };
    };
    environment.systemPackages = with pkgs; [
        # KDE Plasma Depends, Bluetooth
        bluedevil
        bluez
        bluez-alsa
        bluez-tools
        libsForQt5.bluez-qt
        libsForQt5.bluedevil
    ];
}