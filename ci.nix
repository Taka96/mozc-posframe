{ pkgs ? import <nixpkgs> {},
  emacs ? (import (builtins.fetchTarball "https://github.com/purcell/nix-emacs-ci/archive/master.tar.gz")).emacs-26-1
}:
let
  check-package = import (builtins.fetchTarball "https://github.com/akirak/emacs-package-checker/archive/v1.tar.gz");
in
{
  org-starter = check-package {
    inherit emacs pkgs;
    name = "mozc-cand-posframe";
    src = ./.;
    targetFiles = ["mozc-cand-posframe.el"];
    emacsPackages = epkgs: (with epkgs.melpaPackages; [
      posframe
      mozc
      s
    ]);
  };
}
