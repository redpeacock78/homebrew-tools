require "formula"

class Exutils < Formula
  desc "Command line extension utilites."
  homepage "https://github.com/redpeacock78"
  url "https://github.com/redpeacock78/exutils.git"
  head "https://github.com/redpeacock78/exutils.git", :branch => "master"
  version '0.0.1'.freeze

  #depends
  depends_on "coreutils"
  depends_on "findutils"
  depends_on "bash"
  depends_on "grep"
  depends_on "gawk"
  depends_on "gnu-sed"

  bottle :unneeded

  def install
    bin.install "bin/inv"
    bin.install "bin/prim"
    bin.install "bin/camb"
    bin.install "bin/divi"
    bin.install "bin/ngram"
    bin.install "bin/stalin"
    bin.install "bin/rpt"
  end
end
