{ config, pkgs, ... };

{
  networking.hostName = "nix-desktop";
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultlocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command", "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.systemd-boot.timeout - 3;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.secureBoot.enable = true;
  boot.loader.systemd-boot.secureBoot.signed = true;

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos-root";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS_EFI";
    fsType = "vfat";
  };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    htop
    btop
    unzip
    nano
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "maarten" ];
  users.groups.docker.members = [ "maarten" ];

  services.openssh.enable = true;

  system.autoUpgrade.enable = false;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.dconf.enable = true;
   
}