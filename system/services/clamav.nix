{ pkgs, lib, config, ... }:

{
  services.clamav = {
    updater = {
      enable = true;
      frequency = 6;
    };
    daemon = {
      enable = true;
      settings = {
        LogVerbose = true;
	    LogFile = "/home/req/logs/clamav.log";
      };
    };
  };
}
