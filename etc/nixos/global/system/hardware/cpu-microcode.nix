# /etc/nixos/global/system/hardware/cpu-microcode.nix

{
    pkgs,
    user,
    ...
}:
let
  # Define Global Variables from (/etc/nixos/tunables/global-vars.nix)
  globalVars = import /etc/nixos/tunables/global-vars.nix { inherit config pkgs lib; };
  # Simplify Global Variables
  systemVariables = globalVars.systemVariables;
  userVariables = globalVars.userVariables;
in
{
    # CPU Enable Microcode Updates.
    # Should be required / enabled by default, but whatever nixos.
    hardware = {
        cpu.${systemVariables.cputype}.updateMicrocode = true;
    };
}
