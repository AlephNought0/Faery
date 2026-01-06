{...}: let
  # Simple function that returns a list of module packages for the custom kernel
  # Takes the said kernel package as the first argument
  # The module has to be located in nixpkgs for now. Maybe sometime later I will make it more versatile
  customKernelPackages = linuxPackages: moduleNames:
    builtins.map (
      name:
        linuxPackages.${name} or
        (throw "Kernel module '${name}' not found in ${linuxPackages.kernel.modDirVersion or "unknown kernel"}")
    )
    moduleNames;
in {
  inherit customKernelPackages;
}
