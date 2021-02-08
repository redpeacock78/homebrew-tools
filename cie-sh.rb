require "formula"

class CieSh < Formula
  desc "Derives the color difference using the method defined by LAB Delta E (CIE76, CIE94, CIEDE2000)."
  homepage "https://github.com/redpeacock78"
  url "https://github.com/redpeacock78/CIE.sh.git"
  head "https://github.com/redpeacock78/CIE.sh.git", :branch => "master"
  license "MIT"
  version '0.0.1'.freeze

  bottle :unneeded

  def install
    bin.install Dir["bin/*"]
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "9.4706", shell_output("#{bin}/lab -dE00 50 50 0 40 50 0")
  end
end
