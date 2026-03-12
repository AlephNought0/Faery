{pkgs, ...}: {
  services.udev = {
    packages = with pkgs; [oversteer wooting-udev-rules];
    extraRules = ''
      SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="3710", ATTRS{idProduct}=="5501", MODE:="0660", GROUP="input", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3710", ATTRS{idProduct}=="5501", MODE:="0660", GROUP="input", TAG+="uaccess"
    '';
  };
}
