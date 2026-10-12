{
  pkgs,
  vars,
  ...
}@args:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Configure printers
  hardware.printers = {
    ensureDefaultPrinter = "XEROX_B215";
    ensurePrinters = [
      {
        name = "XEROX_B215";
        # IPP is now the new universal standard. PostScript based printing has become obsolete.
        # Note: lpadmin queries the printer when the queue is created, so it
        # has to be powered on during a rebuild that (re)creates this queue.
        deviceUri = "ipp://192.168.1.2/ipp/print";
        model = "everywhere";

        description = "Xerox B215 Multifunctional Printer";
        location = "Living Room";

        # Options passed to lpadmin, which can be listed with
        # `lpoptions -l -p <printer-name>`
        ppdOptions = {
          PageSize = "A4";
          Duplex = "DuplexNoTumble";
        };
      }
    ];
  };

  users.users.${args.vars.mainUsername}.extraGroups = [
    "scanner"
    "lp"
  ];
}
