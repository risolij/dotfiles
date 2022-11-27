{ config, lib, pkgs, ... }:

{
  hardware = {
    cpu.intel.updateMicrocode = true;

    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };

    sensor.iio.enable = true;
  };
}
