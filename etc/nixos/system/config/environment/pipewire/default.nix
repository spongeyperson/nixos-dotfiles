{
    pkgs,
    user,
    ...
}: {
    environment.etc = {
        "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
            bluez_monitor.properties = {
                ["bluez5.enable-sbc-xq"] = true,
                ["bluez5.enable-msbc"] = true,
                ["bluez5.enable-hw-volume"] = true,
                ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
            }
        '';
        "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
            context.properties = {
                default.clock.rate = 48000
                default.clock.quantum = 32
                default.clock.min-quantum = 32
                default.clock.max-quantum = 32
            }
        '';
    };
}