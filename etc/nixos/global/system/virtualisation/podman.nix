# /etc/nixos/global/system/virtualisation/podman.nix

{
    config,
    lib,
    pkgs,
    ...
}: {
    # Podman
    virtualisation.podman = {
        enable = true;
        # Enable compat to use podman as a drop-in replacement for docker.
        #dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
    };
}
