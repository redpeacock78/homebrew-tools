require "formula"

class Sushiro < Formula
  desc "Converts a sentence to Fujiwara Tatsuya-style or restores it."
  homepage "https://github.com/redpeacock78"
  url "https://github.com/redpeacock78/hujitatsu.git"
  head "https://github.com/redpeacock78/hujitatsu.git", :branch => "master"
  version '0.0.1'.freeze

  #depends
  depends_on "nkf"
  depends_on "vim"

  bottle :unneeded

  def install
    bin.install "hujitastu -h"
  end
end