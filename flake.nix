{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flakelight.url = "github:nix-community/flakelight";
  inputs.flakelight-darwin.url = "github:cmacrae/flakelight-darwin";
    inputs.napalm.url = "github:nix-community/napalm";
      inputs.napalm.inputs.nixpkgs.follows = "nixpkgs";
  outputs =
    {
      flakelight
    , flakelight-darwin
    , napalm
    , ...
    } @ inputs:
    flakelight ./. {
      inherit inputs;
      imports = [ flakelight-darwin.flakelightModules.default flakelight.flakelightModules.flakelightModule ];
      devShell.packages = pkgs: [ pkgs.hello pkgs.coreutils pkgs.alejandra pkgs.deno pkgs.nodejs pkgs.ocamlPackages.reanalyze pkgs.biome pkgs.pnpm pkgs.nodePackages.node2nix];

      package = { stdenv, defaultMeta, nodejs, pnpm, geist-font }:
        stdenv.mkDerivation (finalAttrs: {
          pname = "foo";
          version = "0-unstable-1980-01-01";
          name = "fwa";
          src = ./.;
          installPhase = ''
            runHook preInstall

            mkdir -p $out/{share,bin}

            cp -r .next/standalone $out/share/homepage/
            cp -r .env $out/share/homepage/
            cp -r public $out/share/homepage/public

            mkdir -p $out/share/homepage/.next
            cp -r .next/static $out/share/homepage/.next/static

            # https://github.com/vercel/next.js/discussions/58864
            ln -s /var/cache/fwa $out/share/homepage/.next/cache

            chmod +x $out/share/homepage/server.js

            # we set a default port to support "nix run ..."
            makeWrapper $out/share/homepage/server.js $out/bin/fwa
            runHook postInstall
          '';
          buildPhase = ''
            pnpm run build
          '';
          postBuild = ''
            # Add a shebang to the server js file, then patch the shebang to use a nixpkgs nodejs binary.
            sed -i '1s|^|#!/usr/bin/env node\n|' .next/standalone/server.js
            patchShebangs .next/standalone/server.js
          '';


          nativeBuildInputs = [
            nodejs
            pnpm.configHook
          ];

          pnpmDeps = pnpm.fetchDeps {
            inherit (finalAttrs) pname version src;
            hash = "sha256-cKkenrlfLFnVbeiUXTdA5NG/rLhid1a9WSM1rEwj/e0=";
          };

          doDist = true;
          meta = defaultMeta;
        });

      devShell. shellHook = ''export PATH="./node_modules/.bin:$PATH"'';

      formatters = pkgs: {
        "*.js" = "${pkgs.biome}/bin/biome format --write";
      };

    };
}
