# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  ## Video
  environment.etc."X11/xorg.conf.d/20-intel.conf" = {
    text = ''
      Section "Device"
        Identifier "Intel Graphics"
        Driver "intel"
        Option "TearFree" "true"
      EndSection
      '';
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  nixpkgs.config.allowUnfree = true;

  ## Boot Loader
  boot = {
    kernelParams = ["intel_iommu=off" ];
    kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;
    blacklistedKernelModules = [ "snd_hda_intel" "snd_soc_skl" ];
    loader.grub = {
      enable = true;
      efiInstallAsRemovable = true;
      efiSupport = true;
      devices = [ "nodev" ];
    };
  };


  ## Networking
  networking = {
    hostName = "nixos";
    wireless.enable = true;
    extraHosts = ''
      xxxxxxxxxxxx control
      xxxxxxxxxxxx node01
      xxxxxxxxxxxx node02'';
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;
    wireless.networks = {
      F41B4D = {
        pskRaw = "XXXXXXXXXXXXXX";
      };
    };
  };

  ## Locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  ## Set your time zone.
  time.timeZone = "America/Phoenix";

  ## System Packages
  environment.systemPackages = with pkgs; [
    dzen2
    rofi
    rustup
    binutils-unwrapped
    gcc
    openssl
  ];

  ## Environment variables
  environment.variables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };

  ## Trezor 
  services.trezord.enable = true;

  ## Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.thermald = {
    enable = true;
    configFile = "/home/req/.config/thermald/thermal-conf.xml";
  };
  
  ## Enable Auto upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  ## Enable sound && sound boot options
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
    extraConfig = ''
      load-module module-alsa-sink	device=hw:0,0 channels=4
      load-module module-alsa-source  device=hw:0,6 channels-4
    '';
  };

  ## Enable the X11 windowing system.
  services.xserver = {
    ## X Server
    enable = true;
    layout = "us";
    
    ## Touchpad
    libinput.enable = true;

    ## WM
    windowManager.herbstluftwm = {
      enable = true;
      configFile = "/home/req/.config/herbstluftwm/autostart";
    };
  };

  ## Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.req = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

