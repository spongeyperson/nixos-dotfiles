# /etc/nixos/user/tyler/tyler.nix
# User Configuration: "Tyler"

{
  config,
  pkgs, 
  lib, 
  ... 
}:
# Import global-vars.nix
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
  # User & User Packages
  # Define a user account. Don't forget to set a password with ‘passwd’, later.
  users = {
  # Set Global Variable Shell as Default:
    defaultUserShell = userVariables.usershell;
    users.${userVariables.username} = {
      isNormalUser = true;
      home = "${userVariables.homedir}";
      uid = userVariables.userid;
      #shell = "${userVariables.usershell}"; - Now Defined in (/etc/nixos/system/config/programs/fish.nix)
      extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "networkmanager" "network" "davfs2" ];
    };
  };
}
