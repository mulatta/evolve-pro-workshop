{
  perSystem =
    {
      pkgs,
      lib,
      ...
    }:
    let
      src = lib.cleanSourceWith {
        src = ../slides;
        filter =
          path: _type:
          let
            baseName = baseNameOf path;
          in
          baseName != "node_modules" && baseName != ".cache";
      };

      node_modules = pkgs.stdenvNoCC.mkDerivation {
        pname = "evolve-pro-workshop-slides-deps";
        version = "0.0.1";

        inherit src;

        nativeBuildInputs = [ pkgs.bun ];

        dontFixup = true;

        buildPhase = ''
          runHook preBuild
          bun install --frozen-lockfile
          runHook postBuild
        '';

        installPhase = ''
          runHook preInstall
          rm -rf node_modules/.cache
          mv node_modules $out
          runHook postInstall
        '';

        outputHashMode = "recursive";
        outputHashAlgo = "sha256";
        outputHash = "sha256-vnRRg3/zEbVIuemtSuz+4eiKeNksNI+GtCfBScdmyxM=";
      };
    in
    {
      packages.slides = pkgs.stdenvNoCC.mkDerivation {
        pname = "evolve-pro-workshop-slides";
        version = "0.0.1";

        inherit src;

        nativeBuildInputs = [ pkgs.bun ];

        dontFixup = true;

        buildPhase = ''
          runHook preBuild
          cp -r ${node_modules} node_modules
          chmod -R u+w node_modules
          bunx slidev build slides.md --base /
          runHook postBuild
        '';

        installPhase = ''
          runHook preInstall
          cp -r dist $out
          runHook postInstall
        '';
      };
    };
}
