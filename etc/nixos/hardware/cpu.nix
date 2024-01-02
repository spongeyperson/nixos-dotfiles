# /etc/nixos/hardware/cpu.nix
# General CPU Configuration

{
    pkgs,
    user,
    ...
}: 
# Import global-vars.nix
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
    # Enable Microcode Updates. 
    # Should be required / enabled by default, but whatever nixos.
    hardware = {
        cpu.${systemVariables.cputype}.updateMicrocode = true;
    };
}