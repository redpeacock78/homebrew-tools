require "formula"

class Sayaka < Formula
  desc "It is a terminal-specific twitter client."
  homepage "https://github.com/isaki68k/sayaka"
  url "https://github.com/isaki68k/sayaka.git"
  head "https://github.com/isaki68k/sayaka.git", :branch => "master"
  version "3.5.3".freeze

  depends_on "vala"
  depends_on "glib"
  depends_on "gdk-pixbuf"
  depends_on "libjpeg"
  depends_on "make"

    def install
    system "./configure"
    system "make", "all"
    bin.install "src/sayaka"
    bin.install "src/sixelv"
  end
end