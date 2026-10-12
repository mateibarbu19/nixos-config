{
  pkgs,
  vars,
  ...
}:
let
  switch-monitor-input-source = pkgs.callPackage ../programs/switch-monitor-input-source.nix { };
in
{
  # NOTE: Temporary solution for my LG27GS95QE OLED monitor
  # fonts.fontconfig.antialias = false;
  # fonts.fontconfig.subpixel.rgba = "rgb";
  fonts.fontconfig.subpixel.lcdfilter = "light";

  boot.kernelModules = [
    "i2c-dev" # for exploiting the DDC (Display Data Channel)
  ];

  # Automatically sets up secure udev rules and creates the 'i2c' group
  # For communication with monitors via ddcutil
  hardware.i2c.enable = true;

  # Monitor quality of life
  environment.systemPackages = [
    pkgs.ddcutil
    switch-monitor-input-source
  ];

  users.users.${vars.mainUsername} = {
    packages = [
      pkgs.gnomeExtensions.brightness-control-using-ddcutil
    ];

    extraGroups = [
      "i2c"
    ];
  };
}
