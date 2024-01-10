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
        # Work Around for Logitech Mice
        logitech-udev-rules
        solaar
    ];
}