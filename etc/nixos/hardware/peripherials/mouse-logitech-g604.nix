{
    config,
    lib,
    pkgs,
    ...
}: {
    hardware.logitech.wireless = {
        enable = true;
        enableGraphical = true;
    };
    environment.systemPackages = with pkgs; [
        # Work Around for Logitech Mice
        logitech-udev-rules
        solaar
    ];
}