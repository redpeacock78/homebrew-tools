require "formula"

class JsonC < Formula
  desc "A JSON implementation in C."
  homepage "https://github.com/json-c/json-c"
  url "https://github.com/json-c/json-c.git"
  head "https://github.com/json-c/json-c.git", :branch => "master"
  version '0.13.99'.freeze

  #depends
  depends_on "gcc" => :build
  depends_on "clang" => :build
  depends_on "cmake" => :build

  def install
    system "mkdir", "json-c-build"
    system "cd", "json-c-build"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "../json-c"
    system "make"
    system "make", "test"
    system "make", "USE_VALGRIND=0", "test"
    system "make", "install"
  end
end