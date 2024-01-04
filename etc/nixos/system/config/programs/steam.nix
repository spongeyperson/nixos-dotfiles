# /etc/nixos/system/config/programs/steam.nix

{
    config,
    lib,
    pkgs,
    ...
}: {
    hardware.steam-hardware.enable = true;
    programs = {
        steam.enable = true;
    };
}