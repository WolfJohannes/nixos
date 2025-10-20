{ pkgs, ... }: {
  users.users.maarten = {
    isNormalUser = true;
    description = "maarten";
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vscode
    git
    docker-compose
    qemu
    virt-manager
    firefox
    discord
    teamspeak3
  ];
}
