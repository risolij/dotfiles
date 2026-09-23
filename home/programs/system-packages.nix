{ pkgs, ... }:
{
    home.packages = with pkgs; [
        ## Hardware Tools
        acpi
        dmidecode
        inxi
        pciutils
        usbutils
        lm_sensors
        ethtool
        
        ## Networking Tools
        dig
        lsof
        nmap
        tcpdump
        
        ## Security Tools
        vulnix
        lynis
        
        ## Notifications
        libnotify
        
        ## Image Tools
        imagemagick
        
        ## Audio Tools
        pavucontrol
        pulsemixer
        
        ## Ledger
        ledger-live-desktop
        trezor-suite
        
        ## Other
        mpv
        
        ## Wayland Package for Niri
        xwayland-satellite
        
        ## chrome
        chromium
        
        ## quickshell legacy
        quickshell
        qt6.qtimageformats
    ];
}
