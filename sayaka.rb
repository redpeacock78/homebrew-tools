require "formula"

class Sayaka < Formula
  desc "It is a terminal-specific twitter client."
  homepage "https://github.com/isaki68k/sayaka"
  url "https://github.com/isaki68k/sayaka.git", :tag => "3.7.5"
  head "https://github.com/isaki68k/sayaka.git", :head => "master"
  version "3.7.5".freeze

  depends_on "vala"
  depends_on "glib"
  depends_on "gdk-pixbuf"
  depends_on "libjpeg"
  depends_on "make"

    def install
        system "make"
        bin.install "vala/sayaka"
  end
end
