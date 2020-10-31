with import <nixpkgs> {};
mkShell {
  buildInputs = [
    bash
    dhall-bash
    dhall-json
  ];
}
