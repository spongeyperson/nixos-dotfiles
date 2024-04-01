# /etc/nixos/virtualisation/docker.nix
# Docker Configuration

{
    config,
    pkgs,
    lib,
    ...
}: {
    # Virtualisation Toggle, Docker.
    virtualisation = {
        docker = {
            enable = true;
            #enableOnBoot = true; # If you want Docker on Boot
            storageDriver = "btrfs";
        };
    };
}