{
  inputs.flakelight.url = "github:nix-community/flakelight";
  inputs.flakelight-darwin.url = "github:cmacrae/flakelight-darwin";
  outputs =
    { flakelight
    , flakelight-darwin
    , ...
    } @ inputs:
    flakelight ./. {
      inherit inputs;
      imports = [ flakelight-darwin.flakelightModules.default flakelight.flakelightModules.flakelightModule ];
      devShell.packages = pkgs: [ pkgs.hello pkgs.coreutils pkgs.alejandra pkgs.deno pkgs.nodejs pkgs.ocamlPackages.reanalyze pkgs.biome ];


      devShell. shellHook = ''export PATH="./node_modules/.bin:$PATH"'';

      formatters = pkgs: {
        "*.js" = "${pkgs.biome}/bin/biome format --write";
      };

    };
}
