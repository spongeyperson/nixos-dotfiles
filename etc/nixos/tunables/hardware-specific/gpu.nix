# /etc/nixos/tunables/hardware-specific/gpu.nix

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
    services.xserver = {
        videoDrivers = [ systemVariables.gputype ];
    };
    hardware = {
        opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
            extraPackages = with pkgs; [
            # Hardware Accel
            mesa
            vaapiVdpau
            libvdpau-va-gl
            # OpenCL ROCM (Compute)
            rocm-opencl-icd
            rocm-opencl-runtime
            ];
        };
    };
}
