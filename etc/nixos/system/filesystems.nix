# /etc/nixos/system/filesystems.nix
# Supported Filesystems Configuration

{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
      # webdav
      davfs2
      autofs5
      fuse
      sshfs
      cadaver

      # General Filesystems
      f2fs-tools
      exfat
      exfatprogs
      xorg.xfs # Why is this FS part of xorg??
      hfsprogs
  ];
}
