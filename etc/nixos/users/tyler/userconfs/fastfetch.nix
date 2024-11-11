# /etc/nixos/users/tyler/userconfs/fastfetch.nix
# Fastfetch configuration file.

{
    config,
    pkgs,
    lib,
    user,
    ...
}: {
    # Add a shell alias for fast fetch configuration
    programs.fish.shellAliases = {
        fastfetch="fastfetch -c ~/.config/fastfetch/spongeyconfig-v1.jsonc";
    };
}