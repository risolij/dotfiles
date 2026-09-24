{ pkgs, ... }:
{
    home.packages = with pkgs; [
        ## Hardware Tools
        acpi
        dmidecode
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
        
        ## Image Tools
        imagemagick
        
        ## Audio Tools
        pavucontrol
        pulsemixer
        
        ## Ledger
        ledger-live-desktop
        trezor-suite
        
        ## Wayland Package for Niri
        xwayland-satellite
        
        ## quickshell legacy
        quickshell
        qt6.qtimageformats
    ];
}
