# /etc/nixos/system/config/programs/liquidctl.nix
# Liquidctl Configuration

{
    config,
    pkgs, 
    lib, 
    ... 
}: {
    # Allow Unstable Repo for Specific Packages: 
    nixpkgs.config = {
        packageOverrides = pkgs: with pkgs; {
        unstable = import <unstable> {};
        };
    };
    environment.systemPackages = with pkgs; [
        unstable.liquidctl # RGB Control
    ];
    # 71-liquidctl.rules
    services = {
        udev.extraRules = ''
            # Rules that grant unprivileged access to devices supported by liquidctl.
            #
            # Users and distros are encouraged to use these if they want liquidctl to work
            # without requiring root privileges (e.g. without the use of `sudo`).
            #
            # In the case of I²C/SMBus devices, these rules also cause the loading of the
            # `i2c-dev` kernel module.  This module is required for access to I²C/SMBus
            # devices from userspace, and manually loading kernel modules is in itself a
            # privileged operation.
            #
            # Distros will likely want to place this file in `/usr/lib/udev/rules.d/`, while
            # users installing this manually SHOULD use `/etc/udev/rules.d/` instead.
            #
            # The suggested name for this file is `71-liquidctl.rules`.  Whatever name is
            # used, it MUST lexically appear before 73-seat-late.rules.  The suggested name
            # was chosen so that it is also lexically after systemd-provided 70-uaccess.rules.
            #
            # Once installed, reload and trigger the new rules with:
            #
            #   # udevadm control --reload
            #   # udevadm trigger
            #
            # Note that this will not change the mode of `/dev/hidraw*` devices that have
            # already been created.  In practice, this means that HIDs may continue to require
            # privileged access until, either, they are rebound to their kernel drivers, or
            # the system is rebooted.
            #
            # These rules assume a system with modern versions of systemd/udev, that support
            # the `uaccess` tag.  On older systems the rules can be changed to instead set
            # GROUP="plugdev" and MODE="0660"; other groups and modes may also be used.
            #
            # The use of the `uaccess` mechanism assumes that only physical sessions (or
            # "seats") need unprivileged access to the devices.[^1][^2]  In case headless
            # sessions are also expected to interactively run liquidctl, GROUP and MODE should
            # also be set, as a fallback.
            #
            # Finally, this file was automatically generated.  To update it, from a Linux
            # shell and the current directory, execute:
            #
            #     $ python generate-uaccess-udev-rules.py > 71-liquidctl.rules
            #
            # [^1]: https://github.com/systemd/systemd/issues/4288
            # [^2]: https://wiki.archlinux.org/title/Users_and_groups#Pre-systemd_groups


            # Section: special cases

            # Host SMBus on Intel mainstream/HEDT platforms
            KERNEL=="i2c-*", DRIVERS=="i801_smbus", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"


            # Section: NVIDIA graphics cards

            # ASUS Strix GTX 1070
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b81", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x8598", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1070 OC
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b81", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x8599", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1070 Ti
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b82", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x861d", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1070 Ti Advanced
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b82", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x861e", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1080
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b80", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x8592", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1080 Advanced
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b80", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x85aa", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1080 OC
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b80", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x85f9", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1080 Ti
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b06", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x85eb", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1080 Ti
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b06", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x85f1", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1080 Ti OC
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b06", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x85ea", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # ASUS Strix GTX 1080 Ti OC
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b06", ATTRS{subsystem_vendor}=="0x1043", \
                ATTRS{subsystem_device}=="0x85e4", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # EVGA GTX 1070 FTW
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b81", ATTRS{subsystem_vendor}=="0x3842", \
                ATTRS{subsystem_device}=="0x6276", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # EVGA GTX 1070 FTW DT Gaming
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b81", ATTRS{subsystem_vendor}=="0x3842", \
                ATTRS{subsystem_device}=="0x6274", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # EVGA GTX 1070 FTW Hybrid
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b81", ATTRS{subsystem_vendor}=="0x3842", \
                ATTRS{subsystem_device}=="0x6278", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # EVGA GTX 1070 Ti FTW2
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b82", ATTRS{subsystem_vendor}=="0x3842", \
                ATTRS{subsystem_device}=="0x6775", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"

            # EVGA GTX 1080 FTW
            KERNEL=="i2c-*", ATTR{name}=="NVIDIA i2c adapter 1 *", ATTRS{vendor}=="0x10de", \
                ATTRS{device}=="0x1b80", ATTRS{subsystem_vendor}=="0x3842", \
                ATTRS{subsystem_device}=="0x6286", DRIVERS=="nvidia", TAG+="uaccess", \
                RUN{builtin}="kmod load i2c-dev"


            # Section: USB devices and USB HIDs

            # ASUS Aura LED Controller
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19af", TAG+="uaccess"

            # ASUS Aura LED Controller
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1939", TAG+="uaccess"

            # ASUS Aura LED Controller
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18f3", TAG+="uaccess"

            # ASUS Ryujin II 360
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1988", TAG+="uaccess"

            # Asetek 690LC (assuming EVGA CLC)
            # Asetek 690LC (assuming NZXT Kraken X)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="2433", ATTRS{idProduct}=="b200", TAG+="uaccess"

            # Corsair Commander Core
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1c", TAG+="uaccess"

            # Corsair Commander Core XT
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c2a", TAG+="uaccess"

            # Corsair Commander Pro
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c10", TAG+="uaccess"

            # Corsair Commander ST
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c32", TAG+="uaccess"

            # Corsair HX1000i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c07", TAG+="uaccess"

            # Corsair HX1000i (2022)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c1e", TAG+="uaccess"

            # Corsair HX1200i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c08", TAG+="uaccess"

            # Corsair HX1500i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c1f", TAG+="uaccess"

            # Corsair HX750i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c05", TAG+="uaccess"

            # Corsair HX850i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c06", TAG+="uaccess"

            # Corsair Hydro H100i GTX
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c03", TAG+="uaccess"

            # Corsair Hydro H100i Platinum
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c18", TAG+="uaccess"

            # Corsair Hydro H100i Platinum SE
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c19", TAG+="uaccess"

            # Corsair Hydro H100i Pro
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c15", TAG+="uaccess"

            # Corsair Hydro H100i Pro XT
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c20", TAG+="uaccess"

            # Corsair Hydro H100i v2
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c09", TAG+="uaccess"

            # Corsair Hydro H110i GTX
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c07", TAG+="uaccess"

            # Corsair Hydro H115i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c0a", TAG+="uaccess"

            # Corsair Hydro H115i Platinum
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c17", TAG+="uaccess"

            # Corsair Hydro H115i Pro
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c13", TAG+="uaccess"

            # Corsair Hydro H115i Pro XT
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c21", TAG+="uaccess"

            # Corsair Hydro H150i Pro
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c12", TAG+="uaccess"

            # Corsair Hydro H150i Pro XT
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c22", TAG+="uaccess"

            # Corsair Hydro H60i Pro XT
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c29", TAG+="uaccess"

            # Corsair Hydro H80i GT
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c02", TAG+="uaccess"

            # Corsair Hydro H80i v2
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c08", TAG+="uaccess"

            # Corsair Lighting Node Core
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1a", TAG+="uaccess"

            # Corsair Lighting Node Pro
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c0b", TAG+="uaccess"

            # Corsair Obsidian 1000D
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1d00", TAG+="uaccess"

            # Corsair RM1000i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c0d", TAG+="uaccess"

            # Corsair RM650i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c0a", TAG+="uaccess"

            # Corsair RM750i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c0b", TAG+="uaccess"

            # Corsair RM850i
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1c0c", TAG+="uaccess"

            # Corsair iCUE H100i Elite RGB
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c35", TAG+="uaccess"

            # Corsair iCUE H150i Elite RGB
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c37", TAG+="uaccess"

            # NZXT Kraken 2023
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="300e", TAG+="uaccess"

            # NZXT Kraken 2023 Elite
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="300c", TAG+="uaccess"

            # NZXT Kraken M22
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="1715", TAG+="uaccess"

            # NZXT Kraken X (X42, X52, X62 or X72)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="170e", TAG+="uaccess"

            # NZXT Kraken X (X53, X63 or X73)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2007", TAG+="uaccess"

            # NZXT Kraken X (X53, X63 or X73)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2014", TAG+="uaccess"

            # NZXT Kraken Z (Z53, Z63 or Z73)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="3008", TAG+="uaccess"

            # NZXT RGB & Fan Controller
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2009", TAG+="uaccess"

            # NZXT RGB & Fan Controller
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200e", TAG+="uaccess"

            # NZXT RGB & Fan Controller
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2010", TAG+="uaccess"

            # NZXT RGB & Fan Controller (3+6 channels)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2011", TAG+="uaccess"

            # NZXT RGB & Fan Controller (3+6 channels)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2019", TAG+="uaccess"

            # NZXT Smart Device (V1)
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="1714", TAG+="uaccess"

            # NZXT Smart Device V2
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2006", TAG+="uaccess"

            # NZXT Smart Device V2
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200d", TAG+="uaccess"

            # NZXT Smart Device V2
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200f", TAG+="uaccess"
        '';
    };
}