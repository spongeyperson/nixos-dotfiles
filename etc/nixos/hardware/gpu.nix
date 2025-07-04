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
    globalVars = import (toString ../global-vars.nix) { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
    environment = {
        systemPackages = with pkgs; [
            # GUI
            corectrl
            lact
            # Commandline
            nvtopPackages.amd
            radeontop
            glxinfo
            libva-utils
            vdpauinfo
            vulkan-tools

            # AMDGPU Pro Drivers
            #linuxKernel.packages.linux_zen.amdgpu-pro
        ];
    };
    # AMDGPU Vulkan / OpenGL (Multilib) Support /w ROCM
    hardware = {
        graphics = {
            enable = true;
            #driSupport = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                # Hardware Accel
                mesa
                vaapiVdpau
                libvdpau-va-gl
                # OpenCL ROCM (Compute)
                #rocm-opencl-icd
                #rocm-opencl-runtime
                #rocmPackages.clr.icd
            ];
        };
    };
    services.xserver = {
        # Set XServer Default Video Driver
        videoDrivers = [ "${systemVariables.gputype}" ];
    };
}