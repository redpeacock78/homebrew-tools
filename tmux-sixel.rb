require "formula"

class TmuxSixel < Formula
  desc "Terminal multiplexer with Sixel."
  homepage "https://tmux.github.io/"
  url "https://github.com/tmux/tmux.git", :branch => "sixel"
  head "https://github.com/tmux/tmux.git", :branch => "sixel"
  version "next-3.2".freeze

  head do
    url "https://github.com/tmux/tmux.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

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

  def patches
    [
      "https://gist.githubusercontent.com/redpeacock78/42d7c3d5711a363492efe9d2da50a176/raw/ecce53cebef0b161a2f74e219e95ce54a2d9a89e/tmux-sixel.patch"
    ]
  end

  def install
    system "sh", "autogen.sh" if build.head?
    ENV.append "LDFLAGS", "-lresolv"
    system "./configure"
    system "make", "install"

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