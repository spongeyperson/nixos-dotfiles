{
    config,
    lib,
    pkgs,
    ...
}: {
    environment.systemPackages = with pkgs; [
        # Logitech Steering Wheel Support
        oversteer
    ];
}