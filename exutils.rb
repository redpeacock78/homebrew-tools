require "formula"

class Exutils < Formula
  desc "Command line extension utilitys."
  homepage "https://github.com/redpeacock78"
  url "https://github.com/redpeacock78/exutils.git"
  head "https://github.com/redpeacock78/exutils.git", :branch => "master"
  version '0.0.1'.freeze

  #depends
  depends_on "coreutils"
  depends_on "gawk"

  bottle :unneeded

  def install
    bin.install "prim"
    bin.install "camb"
  end
end