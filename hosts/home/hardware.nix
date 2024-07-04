{ config, lib, pkgs, ... }:
{
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;

    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel vaapiVdpau libvdpau-va-gl
      ];
    };

    sensor.iio.enable = true;
  };
}
