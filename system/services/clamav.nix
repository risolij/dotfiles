{ pkgs, lib, config, ... }:

{
  services.clamav = {
    updater.enable = true;
    daemon = {
      enable = true;
      settings = {
        LogVerbose = true;
	LogFile = "/home/req/logs/clamav.log";
      };
    };
  };
}
