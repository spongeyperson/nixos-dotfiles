{
    pkgs,
    user,
    ...
}: {
    # environment.etc = {
    #     "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
    #         bluez_monitor.properties = {
    #             ["bluez5.enable-sbc-xq"] = true,
    #             ["bluez5.enable-msbc"] = true,
    #             ["bluez5.enable-hw-volume"] = true,
    #             ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
    #         }
    #     '';
    #     "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
    #         context.properties = {
    #             default.clock.rate = 48000
    #             default.clock.quantum = 32
    #             default.clock.min-quantum = 32
    #             default.clock.max-quantum = 32
    #         }
    #     '';
    # };


    # Pipewire Low Latency, as Specified by NixOS Wiki:
    #https://nixos.wiki/wiki/PipeWire#Low-latency_setup
    environment.etc = {
        "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
            context.properties = {
            default.clock.rate = 48000
            default.clock.quantum = 32
            default.clock.min-quantum = 32
            default.clock.max-quantum = 32
            }
        '';
    };
    # environment.etc = let
    #     json = pkgs.formats.json {};
    # in {
    #     "pipewire/pipewire-pulse.d/92-low-latency.conf".source = json.generate "92-low-latency.conf" {
    #         context.modules = [
    #             {
    #                 name = "libpipewire-module-protocol-pulse";
    #                 args = {
    #                 pulse.min.req = "32/48000";
    #                 pulse.default.req = "32/48000";
    #                 pulse.max.req = "32/48000";
    #                 pulse.min.quantum = "32/48000";
    #                 pulse.max.quantum = "32/48000";
    #                 };
    #             }
    #         ];
    #         stream.properties = {
    #             node.latency = "32/48000";
    #             resample.quality = 1;
    #         };
    #     };
    # };
}