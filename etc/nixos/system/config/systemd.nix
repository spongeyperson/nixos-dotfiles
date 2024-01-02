# /etc/nixos/system/config/systemd.nix

{
    config,
    pkgs,
    lib,
    ...
}: {
    systemd.extraConfig = ''
        DefaultTimeoutStopSec=45s
    '';
}