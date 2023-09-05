# User Configuration: "Tyler" - /user/tyler/tyler.nix

  #TODO: Cleanup
{ 
  #commonVariables,
  config,
  pkgs, 
  lib, 
  ... 
}:
let
  globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
  commonVariables = globalVars.commonVariables;
in
# let
#   # Tunables. These can be changed.
#   user = "tyler"; # Set Global User Account Name.
#   overlays = import ./packages/user-packages.nix { inherit pkgs user; }; # Create an Overlay Variable for the following import file
  
#   # Don't Change this.
#   homedir = "/home/${user}"; # Global Home Variable.
# in
{
  imports = [
    ./packages/user-packages.nix
    #(import ./packages/user-packages.nix { inherit commonVariables; })
  ];

  # User & User Packages
  # Define a user account. Don't forget to set a password with ‘passwd’, later.
  users = {
    defaultUserShell = commonVariables.usershell;
    users.${commonVariables.username} = {
      isNormalUser = true;
      home = commonVariables.homedir;
      uid = 1000;
      shell = commonVariables.usershell;
      extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "networkmanager" "network" "davfs2" ];
    };
  };
}