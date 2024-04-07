# /etc/nixos/system/config/programs/coolercontrol.nix
# CoolerControl Configuration

#TODO: Move config to individual hardware requirement, config. (example: Kraken X62 or Corsair AIO Config.)

{
    config,
    pkgs, 
    lib, 
    ... 
}: {
    # Allow Unstable Repo for Specific Packages: 
    # nixpkgs.config = {
    #     packageOverrides = pkgs: with pkgs; {
    #         unstable = import <unstable> {};
    #     };
    # };
    environment.systemPackages = with pkgs; [
        # (import <unstable> {}).coolercontrol.coolercontrol-gui
        # (import <unstable> {}).coolercontrol.coolercontrold
        # (import <unstable> {}).coolercontrol.coolercontrol-ui-data
        # (import <unstable> {}).coolercontrol.coolercontrol-liqctld
        coolercontrol.coolercontrol-gui
        coolercontrol.coolercontrold
        coolercontrol.coolercontrol-ui-data
        coolercontrol.coolercontrol-liqctld
    ];
    # programs = {
    #     coolercontrol.enable = true;
    # };
}