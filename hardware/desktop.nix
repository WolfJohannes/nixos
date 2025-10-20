{ config, pkgs, ... };

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
    open = false;
  };

  programs.steam.enable = true;
  hardware.opengl.driSupport32Bit = true;

}