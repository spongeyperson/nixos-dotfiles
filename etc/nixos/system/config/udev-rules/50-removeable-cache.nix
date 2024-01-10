# /etc/nixos/system/config/udev-rules/50-removeable-cache.nix
# Tweak Removable Disk Drive Cache

{
    config,
    lib,
    pkgs,
    ...
}: {
    services = {
        udev.extraRules = ''
            # limit cache of removable drives to improve umount time
            ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{removable}=="1", ATTR{bdi/max_ratio}="5"
        '';
    };
}