require "formula"

class MltermCocoa < Formula
  homepage "http://mlterm.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/mlterm/01release/mlterm-3.6.0/mlterm-3.6.0.tar.gz"
  head "https://bitbucket.org/arakiken/mlterm", :using => :hg
  sha256 "b6b08e3ce3c2136ed091776f0bb3b9ad0b7070bc2d845c9debe6e2cdc34cec05"
  version "3.6.0".freeze

  depends_on 'pkg-config' => :build
  depends_on 'gdk-pixbuf'
  depends_on 'cairo'
  depends_on 'sdl2'
  depends_on 'sdl2_ttf'
  depends_on 'fontconfig'
  depends_on 'fribidi'
  depends_on 'gtk+3'
  depends_on 'libssh2'
  depends_on 'gettext'

  def install
    system "./configure", "--with-gui=quartz", "--with-type-engines=cairo", "--with-imagelib=gdk-pixbuf", "--with-gtk=3.0", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    system "cp -pvr cocoa/mlterm.app /Applications/"
    system "mkdir -p /Applications/mlterm.app/Contents/MacOS"
    system "HOME=/Applications cocoa/install.sh #{prefix}"
  end
end
