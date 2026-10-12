{
  writeShellApplication,
  ddcutil,
}:
writeShellApplication {
  name = "switch_monitor_input_source";

  runtimeInputs = [
    ddcutil
  ];

  text = builtins.readFile ./switch_monitor_input_source.sh;
}
