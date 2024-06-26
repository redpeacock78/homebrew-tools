require "formula"

class Sayaka < Formula
  desc "It is a terminal-specific Misskey client."
  homepage "https://github.com/isaki68k/sayaka"
  url "https://github.com/isaki68k/sayaka.git", :tag => "3.7.5"
  head "https://github.com/isaki68k/sayaka.git", :head => "master"
  version "3.7.5".freeze

  depends_on "bsdmake"
  depends_on "gcc"
  depends_on "pkg-config"
  depends_on "wslay"
  depends_on "webp"
  depends_on "mbedtls"
  depends_on "libiconv"

    def install
        system "CXX=g++ CPPFLAGS=-std=c++17 ./configure"
        system "bsdmake", "-DRELEASE", "sayaka"
        bin.install "sayaka"
  end
end
