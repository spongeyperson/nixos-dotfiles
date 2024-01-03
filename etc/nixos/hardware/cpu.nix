# /etc/nixos/hardware/cpu.nix
# CPU Configuration

{
    pkgs,
    user,
    ...
}: {
    # AMD CPU Enable Microcode Updates. 
    # Should be required / enabled by default, but whatever nixos.
    hardware = {
        cpu.amd.updateMicrocode = true;
    };
}