# User Configuration: "Tyler" - /user/tyler/tyler.nix

{
  config,
  pkgs, 
  lib, 
  ... 
}:
# Import global-vars.nix
let
  globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
  commonVariables = globalVars.commonVariables;
in
{
  imports = [
    ./packages/user-packages.nix
  ];

  # User & User Packages
  # Define a user account. Don't forget to set a password with ‘passwd’, later.
  users = {
  # Set Global Variable Shell as Default:
    defaultUserShell = commonVariables.usershell;
    users.${commonVariables.username} = {
      isNormalUser = true;
      home = "${commonVariables.homedir}";
      uid = 1000;
      #shell = commonVariables.usershell;
        # Moved to /etc/nixos/global-vars.nix
      extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "networkmanager" "network" "davfs2" ];
    };
  };
}