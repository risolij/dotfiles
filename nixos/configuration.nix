# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  ## Sound Boot Configurations
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.blacklistedKernelModules = [ "snd_hda_intel" "snd_soc_skl" ];
  hardware.pulseaudio.extraConfig = ''
    load-module module-alsa-sink	device=hw:0,0 channels=4
    load-module module-alsa-source	device=hw:0,6 channels-4
  '';

  ## Boot Loader
  boot.kernelParams = [ "intel_iommu=off" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.devices = [ "nodev" ];


  ## Networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.extraHosts = ''
    xxxxxxxxxxxx control
    xxxxxxxxxxxx node01
    xxxxxxxxxxxx node02'';

  networking.wireless.networks = {
    F41B4D = {
      pskRaw = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    };
  }; networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;

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
  ];

  ## Environment variables
  environment.variables.EDITOR = "nvim";
  environment.variables.TERMINAL = "alacritty";

  ## Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  ## Enable Auto upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  ## Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  ## Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.windowManager.herbstluftwm.enable = true;
  services.xserver.windowManager.herbstluftwm.configFile = "/home/req/.config/herbstluftwm/autostart";

  ## Enable touchpad support.
  services.xserver.libinput.enable = true;

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

