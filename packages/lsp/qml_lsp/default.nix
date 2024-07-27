{
  stdenv,
  go,
}:
stdenv.mkDerivation rec {
  pname = "qml_lsp";
  version = "2.0";

  src = builtins.fetchgit {
    url = "https://invent.kde.org/sdk/qml-lsp.git";
    rev = "v${version}";
    sha256 = "sha256-value";
  };

  buildInputs = [
    go
  ];

  buildPhase = ''
    go build --ldflags '-linkmode external' -o qml-lsp ./cmd/qml-lsp
    go build --ldflags '-linkmode external' -o qml-lint ./cmd/qml-lint
    go build --ldflags '-linkmode external' -o qml-refactor-fairy ./cmd/qml-refactor-fairy
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 qml-lsp $out/bin/qml-lsp
    install -Dm755 qml-lint $out/bin/qml-lint
    install -Dm755 qml-refactor-fairy $out/bin/qml-refactor-fairy
  '';
}
