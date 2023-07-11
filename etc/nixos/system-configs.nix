#############################
# Spongey's NixOS Custom    #
# "system-configs.nix" file #
#############################
# Edit this configuration file to define what should be installed on
# your system. this configuration file should contain other config 
# files that will be created around the filesystem, seperate to that
# which would be defined under variables. This file should only contain
# custom configuration, for files.

{ config, lib, pkgs, ... }:

let
    udevRulesPath = "/etc/udev/rules.d/99-my-rules.rules";
    sambaConfigPath = "/etc/samba/smb.conf";
    xorgConfigPath = "/etc/X11/xorg.conf";
in
{
  # Option for udev rules
  options.services.udev.rules = {
    enable = mkEnableOption "udev-rules";
    configFile = mkOption {
        type = types.str;
        default = udevRulesPath;
        description = "Path to the udev rules file";
    };
  };

  # Option for Samba configurations
  options.services.samba = {
    enable = mkEnableOption "samba";
    configFile = mkOption {
      type = types.str;
      default = sambaConfigPath;
      description = "Path to the Samba configuration file";
    };
  };

  # Option for Xorg configurations
  options.services.xserver = {
    enable = mkEnableOption "xserver";
    config = mkOption {
      type = types.str;
      default = xorgConfigPath;
      description = "Path to the Xorg configuration file";
    };
  };

  # Configuration for udev rules
  config = mkIf config.services.udev.rules.enable {
    systemd.tmpfiles.rules = [
      "w ${config.services.udev.rules.configFile} - - - - $(cat <<EOF
        # Your udev rules content here
        EOF
      )"
    ];
  } config;

  # Configuration for Samba
  config = mkIf config.services.samba.enable {
    services.samba = {
      enable = true;
      config = config.services.samba.configFile;
    };
  } config;

  # Configuration for Xorg
  config = mkIf config.services.xserver.enable {
    services.xserver = {
      enable = true;
      config = config.services.xserver.config;
    };
  } config;
}
