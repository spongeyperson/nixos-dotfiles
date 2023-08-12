{
    pkgs,
    user,
    ...
}: {
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
            ];
        };
    };
}