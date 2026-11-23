{
  description = "Typst :)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f (import nixpkgs { inherit system; }));
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [ pkgs.typst ];
          # Fonts used by the themes in ./themes
          TYPST_FONT_PATHS = pkgs.lib.concatMapStringsSep ":" (f: "${f}/share/fonts") [
            pkgs.inter
            pkgs.ibm-plex
            pkgs.jetbrains-mono
          ];
        };
      });
    };
}

