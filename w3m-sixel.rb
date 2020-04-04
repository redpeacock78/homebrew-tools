require "formula"

class W3mSixel < Formula
  desc "Pager/text based browser with Sixel."
  homepage "https://w3m.sourceforge.io/"
  revision 6
  head "https://github.com/tats/w3m.git", :branch => "master"

  stable do
    url "https://downloads.sourceforge.net/project/w3m/w3m/w3m-0.5.3/w3m-0.5.3.tar.gz"
    sha256 "e994d263f2fd2c22febfbe45103526e00145a7674a0fda79c822b97c2770a9e3"

    # Upstream is effectively Debian https://github.com/tats/w3m at this point.
    # The patches fix a pile of CVEs
    patch do
      url "https://deb.debian.org/debian/pool/main/w/w3m/w3m_0.5.3-37.debian.tar.xz"
      sha256 "625f5b0cb71bf29b67ad3bb9c316420922877473a6e94e6c7bcc337cb22ce1eb"
      apply "patches/010_upstream.patch",
            "patches/020_debian.patch"
    end
  end

  depends_on "pkg-config" => :build
  depends_on "bdw-gc"
  depends_on "openssl@1.1"
  depends_on "libsixel"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  def patches
    [
      "https://gist.githubusercontent.com/redpeacock78/378c445c3429734a0aa3499e9b2cb059/raw/a594f0f9e35c6160e60c0f81ee433518efdf89a5/w3m-sixel.patch"
    ]
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--enable-image",
                          "--with-ssl=#{Formula["openssl@1.1"].opt_prefix}"
    system "make", "install"
  end

  test do
    assert_match /DuckDuckGo/, shell_output("#{bin}/w3m-sixel -dump https://duckduckgo.com")
  end
end