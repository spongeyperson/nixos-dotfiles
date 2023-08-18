# User Configuration Import - /user/default.nix

{
  commonVariables,
  ...
}: {
  imports = [
    # Import User Folder + User Config
    (import ./tyler/tyler.nix { inherit commonVariables; })
  ];
}