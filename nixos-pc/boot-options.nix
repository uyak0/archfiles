{ config, ... }:

{
  boot = {
    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.systemd.dbus.enable = true;
    supportedFilesystems = [ "ntfs" ];

    # Virtual Camera 
    extraModulePackages = with config.boot.kernelPackages;
    [ v4l2loopback.out ];
    kernelModules = [
      "v4l2loopback"
    ];
    extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
    '';
  };
}
