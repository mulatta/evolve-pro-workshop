{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          zensical
          slidev-cli
          bun
        ];
      };
    };
}
