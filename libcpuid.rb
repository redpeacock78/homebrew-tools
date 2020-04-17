require "formula"

class Libcpuid < Formula
    desc "libcpuid is a small C library for x86 CPU detection and feature extraction."
    homepage "https://libcpuid.sourceforge.io"
    url "https://github.com/anrieff/libcpuid.git"
    head "https://github.com/anrieff/libcpuid.git", :branch => "master"
    version "0.4.1".freeze

    #depends
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build

    def install
        system "type", "glibtoolize", ">", "/dev/null", "2&>1", "&&", "glibtoolize", "||", "libtoolize"
        system "autoreconf", "--install"
        system "./configure", "--prefix=#{prefix}"
        system "make"
        system "make", "install"
    end
end
