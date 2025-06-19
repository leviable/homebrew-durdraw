class Durdraw < Formula
  include Language::Python::Virtualenv

  desc "Terminal based ANSI Art text editor for drawing in the Linux/Unix/macOS terminal"
  homepage "https://durdraw.org"
  url "https://github.com/cmang/durdraw/archive/refs/tags/0.29.0.tar.gz"
  sha256 "7878cc0ed97d03defe01f24935f0fbe18d11c1cfc5c3b801ee12c9116dddf0c5"
  license "BSD-3-Clause"

  bottle do
    root_url "https://ghcr.io/v2/leviable/durdraw"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b6491a7e7ec6dcbbab444906b5aa31c852b38c592fd3fff59f2d45261a376261"
    sha256 cellar: :any_skip_relocation, ventura:       "218da5bc27ab7daa20b2b3938fce87bdcf467e9bb5fe0bced0fc8408bee6699f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2effaa87f9e144aa5115848be945d7953a51f6c3a903b0d0e3df3b9187488d14"
  end

  depends_on "ansilove"
  depends_on "neofetch"
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    # Check that valid semver is returned
    version = shell_output("#{bin}/durdraw -V").strip
    assert_match(/\b\d+\.\d+\.\d+\b/, version)
    # Verify program's -V output matches the version we downloaded
    assert_match version.to_s, version
  end
end
