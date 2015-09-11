# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.luks.devices = [
    { name = "lorax"; device = "/dev/sda2"; preLVM = true; } 
    { name = "vm"; device = "/dev/sdb1"; }
  ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "usb_storage" "usbhid" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c4a9a51b-6e0d-45d0-aefb-31e43611c929";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/62b15947-f35f-4237-ab02-9fbaef441355";
      fsType = "ext2";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/3f02a4b1-99f0-46bd-8079-a30ca14fef93";
      fsType = "ext4";
    };

  fileSystems."/home/k/vm" =
    { device = "/dev/disk/by-uuid/9f1893c0-69f1-448c-b3ab-d5d7feb42c2b";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d64a3753-8248-4fbf-86c3-51aefe956c32"; }
    ];

  networking.hostName = "lorax";
  
  services.xserver.xkbOptions = "compose:ralt";
  services.xserver.videoDrivers = [ "nvidiaLegacy304" ];

  nix.maxJobs = 8;
}