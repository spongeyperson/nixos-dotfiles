# User Configuration: "Tyler" - /user/tyler/tyler.nix

{ 
  config, 
  lib, 
  pkgs, 
  ... 
}: 
let
  # Tunables. These can be changed.
  user = "tyler"; # Set Global User Account Name.
  overlays = import ./packages/user-packages.nix { inherit pkgs user; }; # Create an Overlay Variable for the following import file
  
  # Don't Change this.
  homedir = "/home/${user}"; # Global Home Variable.
in
{
  imports = [
    overlays
  ];

  # User & User Packages
  # Define a user account. Don't forget to set a password with ‘passwd’, later.
  users = {
    defaultUserShell = pkgs.fish;
    users.${user} = {
      isNormalUser = true;
      home = homedir;
      uid = 1000;
      shell = pkgs.fish;
      extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "networkmanager" "network" "davfs2" ];
    };
  };
}