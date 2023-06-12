{ buildGoModule
, fetchFromGitHub
, lib
, nix-update-script
}:

buildGoModule rec {
  pname = "gut";
  version = "0.2.8";

  src = fetchFromGitHub {
    owner = "julien040";
    repo = "gut";
    rev = version;
    sha256 = "sha256-18Tqgl84QPCsFNyV2oGQnLRI7WPK24X+4Mxk8Eh3FIQ=";
  };

  vendorSha256 = "sha256-E4jr+dskBdVXj/B5RW1AKyxxr+f/+ZW42OTO9XbCLuw=";

  ldflags = [ "-s" "-w" "-X github.com/julien040/gut/src/telemetry.gutVersion=${version}" ];

  # Checks if `/home` exists
  doCheck = false;

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "An easy-to-use git client for Windows, macOS, and Linux";
    homepage = "https://github.com/slackhq/go-audit";
    maintainers = [ lib.maintainers.paveloom ];
    license = [ lib.licenses.mit ];
  };
}
