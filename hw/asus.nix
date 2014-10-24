# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "nouveau" "xhci_hcd" "ehci_pci" "ahci" "usb_storage" "usbhid" ];
  boot.initrd.luks.devices = [ 
    { name = "pvol1"; device = "/dev/sda3"; preLVM = true; }  
    { name = "pvol2"; device = "/dev/sdb1"; preLVM = true; }  
  ];
  boot.kernelModules = [ "kvm-intel" "aes" "sha1" "sha256" "xts" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/poodle-root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/sda2";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/mapper/poodle-home";
      fsType = "ext4";
    };

  fileSystems."/var" =
    { device = "/dev/mapper/poodle-var";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/dm-2"; }
    ];

  nix.maxJobs = 8;

  services.xserver = {
    xkbOptions = "compose:ralt";
    xrandrHeads = [ "DVI-0" "VGA-0" ];
  };

  networking.hostName = "poodle";
}
