{ fetchFromGitHub
, stdenv
, zlib
}:
stdenv.mkDerivation rec {
  pname = "balong-usbdload";
  version = "c0ebd14883d5f85d93970e29fc521acf6e3229d9";

  src = fetchFromGitHub {
    owner = "forth32";
    repo = "balong-usbdload";
    rev = version;
    hash = "sha256-jdRIwnqF6f3gS5eCCT0jPMmXq5YEuzzjuPyp/O3NaxM=";
  };

  installPhase = "install -Dm755 -t $out/bin balong-usbdload";

  meta.mainProgram = "balong-usbdload";
}
