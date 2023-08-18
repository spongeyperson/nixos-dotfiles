# Podman Configuration - /virtualisation/podman/default.nix

{
    config,
    pkgs,
    lib,
    ...
}: {
    # Virtualisation Toggle, Docker.
    virtualisation = {
        podman = {
            enable = true;
            # Enable compat to use podman as a drop-in replacement for docker.
            #dockerCompat = true;
            defaultNetwork.settings.dns_enabled = true;
        };
    };
}