# /etc/nixos/hardware/gpu.nix
# GPU OpenGL Configuration

{
    config,
    pkgs,
    lib,
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
    # AMDGPU Vulkan / OpenGL (Multilib) Support /w ROCM
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
                nvtop-amd
            ];
        };
    };
    services.xserver = {
        # Set XServer Default Video Driver
        videoDrivers = [ "${systemVariables.gputype}" ];
    };
}