{
  description = "Lambda Calculus Parser";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, ... }@inputs: inputs.utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells = {
          default = pkgs.mkShell {
            name = "Lambda Calculus Parser";
            #buildInputs 
            packages = with pkgs; [
              cmake
              cmake-format
              cmake-language-server
              clang-tools

              gdb

              nixd
              nixpkgs-fmt
            ];

          };
        };

        packages.default = pkgs.callPackage ./default.nix { };
      });
}

