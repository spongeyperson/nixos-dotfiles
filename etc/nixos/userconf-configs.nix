###############################
# Spongey's NixOS Custom      #
# "userconf-configs.nix" file #
###############################
# This configuration file
# contains non-declarative user
# configuration files.

{ config, pkgs, ... }:

{
  imports =
    [ 
      <home-manager/nixos>
    ];
  
  ## 

  ## Generative, Hard-Coded Files:
  home-manager.users.tyler = { pkgs, ... }: { };
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  
  # Mangohud Config
  home.file = {
    ".config/MangoHud/MangoHud.conf".text = ''
      ################### File Generated by userconf-configs.nix ###################
      #                        https://github.com/spongeyperson                    #
      ##############################################################################

      ##fps_limit=
      #toggle_fps_limit=F1
      #vsync=3

      legacy_layout=false
      #hud_compact
      pci_dev=0:03:00.0
      gpu_stats
      gpu_temp
      gpu_core_clock
      gpu_mem_clock
      gpu_power
      gpu_load_change
      gpu_load_value=50,90
      gpu_load_color=FFFFFF,FFAA7F,CC0000
      gpu_text=RX 6800XT
      cpu_stats
      cpu_temp
      cpu_mhz
      cpu_load_change
      core_load_change
      cpu_load_value=50,90
      cpu_load_color=FFFFFF,FFAA7F,CC0000
      cpu_color=2e97cb
      cpu_text=TR 3960x
      io_stats
      io_read
      io_write
      io_color=a491d3
      vram
      vram_color=ad64c1
      ram
      ram_color=c26693
      procmem
      procmem_shared
      procmem_virt
      fps
      engine_color=eb5b5b
      gpu_color=2e9762
      vulkan_driver
      wine
      wine_color=eb5b5b
      frame_timing=1
      frametime_color=00ff00
      throttling_status
      show_fps_limit
      gamemode
      gamepad_battery
      media_player_color=ffffff
      table_columns=3
      background_alpha=0.4
      font_size=24

      background_color=020202
      position=bottom-right
      text_color=ffffff
      round_corners=6
      #GOVERLAY_THEME=mangohuddefault
      toggle_hud=Shift_R+F12
      toggle_hud_position=Shift_R+F11
      toggle_logging=Shift_L+F2
      upload_log=F5
      output_folder=/home/tyler
      media_player_name=spotify
    '';
  };
}