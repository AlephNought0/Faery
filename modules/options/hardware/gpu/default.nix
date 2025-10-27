{lib, ...}: let
  inherit (lib) mkOption;
  inherit (lib.types) enum;
in {
  # Erm... what if I have intel iGPU with nvidia dGPU or amd iGPU with nvidia dGPU or intel iGPU with amd dGPU or amd iGPU with intel dGPU 🤓
  # Uh, I guess I will cry in the corner while trying to figure out how to make this work.
  # In the end I am biased towards AMD, so my experience with configuring nvidia and intel are non-existent.
  options.faery.hardware.gpu = mkOption {
    type = enum ["amd" "nvidia" "intel"];
    description = "This will install the drivers required for the gpu of the specified manufacturer";
  };
}
