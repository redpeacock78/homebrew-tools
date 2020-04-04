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

  resource "completion" do
    url "https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/homebrew_1.0.0/completions/tmux"
    sha256 "05e79fc1ecb27637dc9d6a52c315b8f207cf010cdcee9928805525076c9020ae"
  end

  def install
    system "sh", "autogen.sh"
    ENV.append "LDFLAGS", "-lresolv"
    system "./configure"
    system "make"
    system "mv", "tmux", "tmux-sixel"
    bin.install "tmux-sixel"

    pkgshare.install "example_tmux.conf"
    bash_completion.install resource("completion")
  end

  def caveats
    <<~EOS
      Example configuration has been installed to:
        #{opt_pkgshare}
    EOS
  end

  test do
    system "#{bin}/tmux-sixel", "-V"
  end
end