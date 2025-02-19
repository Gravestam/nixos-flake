{ lib, stdenv, fetchFromGitHub, qt5, cmake, ninja, curl, zlib, mesa, glib, patchelf }:

stdenv.mkDerivation rec {
  pname = "robo3t";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "Studio3T";
    repo = "robomongo";
    rev = "v${version}";
    sha256 = "175g3r420gi9pbpmigaza8rx07fr95n7rm3kahzrk1l8b812psgk";
  };

  nativeBuildInputs = [ cmake ninja patchelf ];

  buildInputs = [
    qt5.qtbase
    qt5.qtsvg
    qt5.qttools
    qt5.qtwayland
    curl
    zlib
    mesa
    glib
  ];

  cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ];

  postFixup = ''
    patchelf --set-rpath "${lib.makeLibraryPath buildInputs}" $out/bin/robo3t
  '';

  meta = with lib; {
    description = "A cross-platform, shell-centric MongoDB management tool";
    homepage = "https://github.com/Studio3T/robomongo";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
