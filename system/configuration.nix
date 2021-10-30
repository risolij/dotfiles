# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ## ./networking/networking.nix
      ./services/services.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

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

  ## Boot Loader
  boot = {
    kernelParams = ["intel_iommu=off" ];
    kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;
    ## blacklistedKernelModules = [ "snd_hda_intel" "snd_soc_skl" ];
    loader.grub = {
      enable = true;
      efiInstallAsRemovable = true;
      efiSupport = true;
      devices = [ "nodev" ];
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
  ];

  ## Environment variables
  environment.variables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
    ANSIBLE_CONFIG= "/home/req/dev/ansible/ansible.cfg";
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
  };

  ## Enable the X11 windowing system.
  services.xserver = {
    ## X Server
    enable = true;
    layout = "us";
    
    ## Touchpad
    libinput.enable = true;

    ## herbstluftwm
    ## windowManager.herbstluftwm = {
    ##   enable = true;
    ##   configFile = "/home/req/.config/herbstluftwm/autostart";
    ## };

    ## xmonad
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };

    displayManager.sddm.enable = true;
  };

  ## Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.plugdev = {};
  users.users.req = {
    isNormalUser = true;
    extraGroups = [ "wheel" "plugdev"]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

