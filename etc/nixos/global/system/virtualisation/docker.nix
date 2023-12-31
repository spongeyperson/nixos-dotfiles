# /etc/nixos/global/system/virtualisation/docker.nix

{
    config,
    lib,
    pkgs,
    ...
}: {
    # Docker
    virtualisation.docker = {
        enable = true;
        storageDriver = "btrfs";
    };
}
