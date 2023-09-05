# Program Configuration Import - /system/config/programs/default.nix

{
  ...
}: {
  imports = [
    ./fish
    ./programs.nix
  ];
}