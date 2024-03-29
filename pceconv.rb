require "formula"

class Pceconv < Formula
  desc "It rips and converts data of PC engine (Super)CD-ROM^2."
  homepage "https://github.com/redpeacock78"
  url "https://github.com/redpeacock78/pceconv.git"
  head "https://github.com/redpeacock78/pceconv.git", :branch => "master"
  version '1.00'.freeze

  #depends
  depends_on "cdparanoia"
  depends_on "cdrdao"
  depends_on "bchunk"
  depends_on "ffmpeg"
  depends_on "gawk"

    def install
    bin.install "pceconv"
  end
end
