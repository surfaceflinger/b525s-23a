{ fetchFromGitHub
, stdenv
, zlib
}:
stdenv.mkDerivation rec {
  pname = "balongflash";
  version = "bf43faa4b5f60205a7950b8ecee5fe81a3226239";

  src = fetchFromGitHub {
    owner = "forth32";
    repo = "balongflash";
    rev = version;
    hash = "sha256-y7lN3luICSSm41jFa5OUCH5qHep1cdQySQFOUlbo74k=";
  };

  buildInputs = [ zlib ];

  installPhase = "install -Dm755 -t $out/bin balong_flash";

  meta.mainProgram = "balong_flash";
}
