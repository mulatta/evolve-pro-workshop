{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem.treefmt = {
    projectRootFile = "flake.nix";
    programs = {
      nixfmt.enable = true;
      deadnix.enable = true;
      statix.enable = true;
      keep-sorted.enable = true;
      mdformat = {
        enable = true;
        plugins = ps: [
          ps.mdformat-gfm
          ps.mdformat-frontmatter
          ps.mdformat-admon
        ];
        settings.wrap = "keep";
      };
    };
    settings.formatter.mdformat.excludes = [
      "slides/**"
      "node_modules/**"
    ];
  };
}
