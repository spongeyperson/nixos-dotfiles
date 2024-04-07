# /etc/nixos/hardware/peripherials/default.nix

{
  ...
}: {
  imports = [
    # File Declarations
    ./gamepad-gulikit-kk2-3.nix
    ./mouse-logitech-g604.nix
    ./wheel-logitech-g29.nix
  ];
}