# /etc/nixos/tunables/user.nix

{ 
  config, 
  lib, 
  pkgs, 
  ... 
}: 
let
  globalVars = import /etc/nixos/tunables/global-vars.nix { inherit config pkgs lib; };
  systemVariables = globalVars.systemVariables;
  userVariables = globalVars.userVariables;
in
{
  imports = [
    overlays
  ];

  # User & User Packages
  # Define a user account. Don't forget to set a password with ‘passwd’, later.
  users = {
    defaultUserShell = userVariables.usershell;
    users.${userVariables.username} = {
      isNormalUser = true;
      home = userVariables.homedir;
      shell = userVariables.usershell;
      uid = userVariables.userid;
      extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "networkmanager" "network" "davfs2" ];
    };
  };
}
