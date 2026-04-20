{
  perSystem =
    { pkgs, ... }:
    {
      packages.docs = pkgs.stdenvNoCC.mkDerivation {
        pname = "evolve-pro-workshop-docs";
        version = "0.0.1";

        src = pkgs.lib.cleanSourceWith {
          src = ../.;
          filter =
            path: _type:
            let
              baseName = baseNameOf path;
            in
            baseName == "docs" || baseName == "zensical.toml" || builtins.match ".*docs/.*" path != null;
        };

        nativeBuildInputs = [ pkgs.zensical ];

        buildPhase = ''
          runHook preBuild
          zensical build --clean
          runHook postBuild
        '';

        installPhase = ''
          runHook preInstall
          cp -r site $out
          runHook postInstall
        '';
      };
    };
}
