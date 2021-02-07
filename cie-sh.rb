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
    system "./install.sh", prefix
    libexec.install "libexec/lab-error"
    libexec.install "libexec/lab-exec-calc"
    libexec.install "libexec/lab-exec-dE76"
    libexec.install "libexec/lab-exec-dE94"
    libexec.install "libexec/lab-exec-dE00"
    libexec.install "libexec/lab-judge-args"
  end

  test do
    assert_match "9.4706", shell_output("#{bin}/lab -dE00 50 50 0 40 50 0")
  end
end
