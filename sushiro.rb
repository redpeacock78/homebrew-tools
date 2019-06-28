require "formula"

class Sushiro < Formula
  desc "🍣 Randomly display the menu of 'Sushiro' 🍣"
  homepage "https://github.com/redpeacock78"
  url "https://github.com/redpeacock78/sushiro.git"
  head "https://github.com/redpeacock78/sushiro.git", :branch => "master"
  version '0.0.7'.freeze
  # sha256 "847696fef76f6d63b70749590a1af55695cb30bef42cd984146d60c7bf6d4a42"

  #depends
  depends_on "curl"
  depends_on "coreutils"

  bottle :unneeded

  def install
    bin.install "sushiro"
  end
end
