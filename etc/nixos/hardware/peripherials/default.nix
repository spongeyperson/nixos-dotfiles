# /etc/nixos/hardware/peripherials/default.nix

{
  ...
}: {
  imports = [
    # File Declarations
    ./gamepad-gulikit-kk2.nix
    ./mouse-logitech-g604.nix
  ];
}