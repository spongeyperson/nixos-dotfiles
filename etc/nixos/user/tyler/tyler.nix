{ 
  config, 
  lib, 
  pkgs, 
  ... 
}: 
let
  user = "tyler";
  overlays = import ./packages/user-packages.nix { inherit pkgs user; }; # Pass 'user' to the import
in
{
  # Apply overlays to the packages directory
  imports = [
    overlays
  ];

  # User & User Packages
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.fish;
    users.${user} = {
      isNormalUser = true;
      home = "/home/tyler";
      uid = 1000;
      shell = pkgs.fish;
      extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "networkmanager" "network" "davfs2" ];
    };
  };
}
