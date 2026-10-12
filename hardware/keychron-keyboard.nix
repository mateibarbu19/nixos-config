{
  services.udev.extraRules = ''
    # Keychron hidraw (Needed for WebUSB access on Chromium browsers)
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", TAG+="uaccess"

    # Configure USB
    SUBSYSTEM=="usb",  ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0a38", TAG+="uaccess"

    # Configure 2.4GHz
    SUBSYSTEM=="usb",  ATTRS{idVendor}=="3434", ATTRS{idProduct}=="d030", TAG+="uaccess"
  '';
}
