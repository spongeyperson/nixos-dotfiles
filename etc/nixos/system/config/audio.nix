# /etc/nixos/system/config/audio.nix

{
    config,
    pkgs,
    user,
    ...
}: {
    # Sound with Pipewire
    #sound.enable = true;
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        #hardware.opengl.extraPackages
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    environment.systemPackages = with pkgs; [
        #pulseaudio

        # GUI Audio Manipulation
        #pavucontrol - replaced with pwvucontrol
        pwvucontrol
        qpwgraph
        easyeffects
        helvum
        sonobus
        coppwr
    ];


    # Pipewire Low Latency, as Specified by NixOS Wiki:
    #https://nixos.wiki/wiki/PipeWire#Low-latency_setup
    services.pipewire.extraConfig.pipewire."92-low-latency" = {
        context.properties = {
            default.clock.rate = 48000;
            default.clock.quantum = 32;
            default.clock.min-quantum = 32;
            default.clock.max-quantum = 32;
        };
    };

    # Some older ways to define Pipewire Low Latency, here incase i need it. Ignore this #

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
