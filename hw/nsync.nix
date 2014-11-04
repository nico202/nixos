# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "usbhid" "usb_storage" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.initrd.luks.devices = [
    { name = "pvol"; device = "/dev/sda2"; preLVM = true; }
  ];

  fileSystems."/" =
    { device = "/dev/mapper/lorax-root";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/mapper/lorax-home";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/sda1";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/dm-1"; }
    ];

  nix.maxJobs = 8;
  networking.hostName = "lorax";
  services.xserver = {
    xkbOptions = "compose:ralt";
    videoDrivers = [ "nvidia" ];
    driSupport32Bit = true;
  };
}
