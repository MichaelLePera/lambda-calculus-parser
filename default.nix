{ llvmPackages_18
, cmake
}:
llvmPackages_18.stdenv.mkDerivation {
  pname = "lambda-calculus-parser";
  version = "0.0.1";

  src = ./.;

  cmakeFlags = [
    "-DENABLE_TESTING=OFF"
    "-DENABLE_INSTALL=ON"
  ];

  nativeBuildInputs = [ cmake ];
  buildInputs = [ ];
}

