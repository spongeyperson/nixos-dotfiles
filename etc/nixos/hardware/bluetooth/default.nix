{
    pkgs,
    user,
    ...
}: {
    # Bluetooth Hardware Enable
    hardware = {
        bluetooth.enable = true;
    };
}