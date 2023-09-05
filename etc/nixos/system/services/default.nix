# Services Configuration Import - /system/services/default.nix

{
  ...
}: {
  imports = [
    ./services.nix
    ./udev-rules.nix
  ];
}