require "formula"

class Pceconv < Formula
  desc "It rips and converts data of PC engine (Super)CD-ROM^2."
  homepage "https://github.com/redpeacock78"
  url "https://github.com/redpeacock78/pceconv"
  head "https://github.com/redpeacock78/pceconv", :branch => "master"
  version '0.0.1'.freeze

  #depends
  depends_on "cdparanoia"
  depends_on "cdrdao"
  depends_on "bchunk"
  depends_on "ffmpeg"

  bottle :unneeded

  def install
    bin.install "pceconv"
  end
end
