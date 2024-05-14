# /etc/nixos/users/tyler/homeman.nix
# Home Manager Config
{
    config,
    pkgs, 
    lib, 
    ... 
}: {
    imports = [ <home-manager/nixos> ];
}