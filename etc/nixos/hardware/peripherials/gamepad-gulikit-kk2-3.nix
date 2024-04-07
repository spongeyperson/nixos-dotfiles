# /etc/nixos/hardware/peripherials/gamepad-gulikit-kk2-3.nix
# Gulikit King Kong 2 & 3 Controller Driver & SystemD keep-alive service

{
    config,
    lib,
    pkgs,
    ...
}: {
    # udev rule
    services = {
        udev.extraRules = ''
            ACTION=="add", SUBSYSTEM=="input", KERNEL=="event*", ATTRS{manufacturer}=="ZhiXu", ATTRS{idProduct}=="028e", ATTRS{idVendor}=="045e", TAG+="systemd", ENV{SYSTEMD_WANTS}="controller-keep-alive@%k"
        '';
    };
    # systemd keep alive service 
    systemd.services.controller-keep-alive = {
    description = "Service to keep alive some Gulikit and 8BitDo controllers";
        serviceConfig = {
            Type = "simple";
            User = "1000";
            ExecStart = "/usr/bin/cat /dev/input/%I";
            StandardOutput = "null";
        };
    };
}