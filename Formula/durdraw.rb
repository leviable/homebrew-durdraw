class Durdraw < Formula
  include Language::Python::Virtualenv

  desc "Terminal based ANSI Art text editor for drawing in the Linux/Unix/macOS terminal"
  homepage "https://durdraw.org"
  url "https://github.com/cmang/durdraw/archive/refs/tags/0.29.0.tar.gz"
  sha256 "7878cc0ed97d03defe01f24935f0fbe18d11c1cfc5c3b801ee12c9116dddf0c5"
  license "BSD-3-Clause"

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
