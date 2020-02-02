{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "k9s";
  version = "0.13.6";
  # rev is the release commit, mainly for version command output
  rev = "8fedc42304ce33df314664eb0c4ac73be59065af";

  src = fetchFromGitHub {
    owner  = "derailed";
    repo   = "k9s";
    rev    = "v${version}";
    sha256 = "1gffbj6pgys6k3i8ikcy3yr2r9cwg0xki55yz5yg6z4a8h0jc8a6";
  };

  buildFlagsArray = ''
    -ldflags=
      -s -w
      -X github.com/derailed/k9s/cmd.version=${version}
      -X github.com/derailed/k9s/cmd.commit=${rev}
  '';

  modSha256 = "04k1wfhyignxy84pvq09fxvvk7pxdswbrzxvxc50dz8n8y7wcnjf";

  meta = with stdenv.lib; {
    description = "Kubernetes CLI To Manage Your Clusters In Style.";
    homepage = https://github.com/derailed/k9s;
    license = licenses.asl20;
    maintainers = with maintainers; [ Gonzih ];
  };
}
