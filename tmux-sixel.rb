require "formula"

class TmuxSixel < Formula
  desc "Terminal multiplexer with Sixel."
  homepage "https://tmux.github.io/"
  url "https://github.com/saitoha/tmux-SIXEL.git", :branch => "sixel"
  head "https://github.com/saitoha/tmux-SIXEL.git", :branch => "sixel"
  version "2.1".freeze

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "libevent"
  depends_on "ncurses"
  depends_on "utf8proc"
  depends_on "libsixel"

  bottle :unneeded

  def install
    system "sh", "autogen.sh"
    ENV.append "LDFLAGS", "-lresolv"
    system "./configure"
    system "make"
    system "mv", "tmux", "tmux-sixel"
    bin.install "tmux-sixel"
  end

  test do
    system "#{bin}/tmux-sixel", "-V"
  end
end