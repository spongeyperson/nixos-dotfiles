#if status is-interactive
#     # Commands to run in interactive sessions can go here
#end

# General Aliases
alias tb="nc termbin.com 9999"
alias termbin="nc termbin.com 9999"
alias clbin="curl -F 'clbin=<-' https://clbin.com"
alias aliases="vim /home/tyler/.config/fish/config.fish"
alias fishconfig="vim /home/tyler/.config/fish/config.fish"
alias vi="vim"
alias phone="scrcpy -t --bit-rate 15M --max-fps 60"
alias grep="grep --color=always"
alias mounts="cat /proc/mounts"
alias lsmounts="cat /proc/mounts"
# alias neofetch="neofetch --config /home/tyler/.config/neofetch/fedora.conf --ascii_distro Fedora"
alias virsh="virsh --connect=qemu:///system"

alias ssh-ident="sh /home/tyler/Git\ Projects/spongeyperson/ssh-ident/ssh-ident.sh"
#alias sunshine="sudo -i PULSE_SERVER=unix:$(pactl info | awk '/Server String/{print$3}') flatpak run dev.lizardbyte.sunshine"


alias duf="duf -hide-fs squashfs"
alias CLEAR="clear"
alias onedrive="rclone serve webdav OD_Chunk:/ --vfs-cache-mode writes -P --cache-db-purge"
alias ports="sudo lsof -i -P -n | grep LISTEN"

#Update OS Function
#alias update="sudo dnf update ; flatpak update"
# function updateos
#     if test -f /etc/arch-release
#         echo "Detected Arch. Run update command? (y/n)"
#         read -l run_update
#         if test $run_update = "y" -o $run_update = "Y"
#             echo "Running update command..."
#             sudo pacman -Syu
#         else
#             echo "Update command skipped."
#         end
#     else if test -f /etc/fedora-release -o -f /etc/nobara-release
#         echo "Detected Fedora. Run update command? (y/n)"
#         read -l run_update
#         if test $run_update = "y" -o $run_update = "Y"
#             echo "Running update command..."
#             sudo dnf update
#         else
#             echo "Update command skipped."
#         end
#     else if test -f /etc/debian_version
#         echo "Detected Debian. Run update command? (y/n)"
#         read -l run_update
#         if test $run_update = "y" -o $run_update = "Y"
#             echo "Running update command..."
#             sudo apt update && sudo apt upgrade
#         else
#             echo "Update command skipped."
#         end
#     else
#         echo "Unsupported or unknown operating system :("
#     end
#
#     echo "Run Flatpak update command? (y/n)"
#     read -l run_flatpak_update
#     if test $run_flatpak_update = "y" -o $run_flatpak_update = "Y"
#         echo "Running Flatpak update command..."
#         flatpak update
#     else
#         echo "Flatpak update command skipped."
#     end
# end




#FLATPAK VSCode
alias code="flatpak run com.visualstudio.code"

#alias chaur="yay --config /etc/pacman-chaotic.conf"

# File Management Tweaks
alias mv="mv -v"
alias cp="cp -v"
alias ls="ls -Ch --color=always"
alias l="ls -alh --color=always"
alias ..="cd .."
alias ...="cd -"
alias chmod="chmod -v"
alias chown="chown -v"

# SSH
alias sshkeys="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/tyler/.ssh/ssh-identities/ -1I '*.pub'"
alias sshkey="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/tyler/.ssh/ssh-identities/ -1I '*.pub'"
alias keys="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/tyler/.ssh/ssh-identities/ -1I '*.pub'"
alias key="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/tyler/.ssh/ssh-identities/ -1I '*.pub'"


# Manipulate KDE
alias lockwidgets="echo -e '\033[0;31mWidgets Locked\033[0m' ; qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'lockCorona(true)'"
alias unlockwidgets="echo -e '\033[0;32mWidgets Unlocked\033[0m' ; qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'lockCorona(false)'"
alias restartkwin="killall kwin_x11 ; nohup kstart5 kwin_x11 </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin Restarted'"
alias restartkwin_x11="killall kwin_x11 ; nohup kstart5 kwin_x11 </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin (X11) Restarted'"
alias restartkwin_wayland="killall kwin_wayland ; nohup kstart5 kwin_wayland </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin (Wayland) Restarted'"
alias restartplasma="killall plasmashell ; nohup kstart5 plasmashell </dev/null &>/dev/null & ; echo -e '\033[0;32mPlasma Shell Restarted'"
#alias rebootplasma="kquitapp5 plasmashell && kstart5 plasmashell > /dev/null 2>&1"
alias rebootplasma="plasmashell --replace &"
alias restartdock="killall latte-dock ; nohup kstart5 latte-dock </dev/null &>/dev/null & ; echo -e '\033[0;32mLatte Dock Restarted'"

# Manipulate System
alias restartpipewire="systemctl --user restart pipewire.{socket,service} ; systemctl --user restart pipewire-pulse.{socket,service} ; echo -e '\033[0;32mPipewire Restarted'"
alias restartaudio="systemctl --user restart pipewire.{socket,service} ; systemctl --user restart pipewire-pulse.{socket,service} ; echo -e '\033[0;32mPipewire Restarted'"

# Manipulate Kraken X62 Hardware (No longer installed)
#alias liquid="sudo liquidctl --match kraken set fan speed 20 30  30 40  35 45  40 55  42 58  43 75  44 80  45 90  46 92  50 100 && sudo liquidctl --match kraken set pump 100 && echo -e '\033[0;32mKraken Pump & Fan Speed Set!\033[0m'"

# Dotfiles Sync
alias config='/usr/bin/git --git-dir=/.dotfiles/ --work-tree=/'
alias dotfiles='/usr/bin/git --git-dir=/.dotfiles/ --work-tree=/'

# Radeon Vulkan Settings
alias radv="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.x86_64.json'"
alias radv64="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.x86_64.json'"
alias radv32="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.i686.json'"
alias amdvlk="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd64.json'"
alias amdvlk64="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd64.json'"
alias amdvlk32="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd32.json'"
alias vulkanicd="ls /usr/share/vulkan/icd.d/*.json"
alias icd="ls /usr/share/vulkan/icd.d/*.json"
##

# Autojump
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish


## Flatpak Fish Workaround
#This *may* not be required anymore, just here for legacy reasons
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end
