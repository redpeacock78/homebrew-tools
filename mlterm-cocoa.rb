require "formula"

class MltermCocoa < Formula
  homepage "http://mlterm.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/mlterm/01release/mlterm-3.8.9/mlterm-3.8.9.tar.gz"
  head "https://bitbucket.org/arakiken/mlterm", :using => :hg
  sha256 "0d5f18c3986cc80cb8d0b1d8720a45be5eb85b2b908016f2f396bd5112e6c7c7"
  keg_only "Conflicts with non-cocoa mlterm."

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
    system "./configure", 'CFLAGS="-I/opt/X11/include/freetype2"', "--with-gui=quartz", "--with-type-engines=cairo", "--with-gtk=3.0", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    system "cp -pvr cocoa/mlterm.app /Applications/"
    system "mkdir -p /Applications/mlterm.app/Contents/MacOS"
    system "HOME=/Applications cocoa/install.sh #{prefix}"
  end
end
