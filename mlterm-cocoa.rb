require "formula"

class MltermCocoa < Formula
  homepage "http://mlterm.sourceforge.net/"
  url "https://sourceforge.net/projects/mlterm/files/01release/mlterm-3.8.9/mlterm-3.8.9.tar.gz"
  head "https://bitbucket.org/arakiken/mlterm", :using => :hg
  sha1 "ab41434fd777ffd173ad0965e7f9dd4500bc6062"
  keg_only "Conflicts with non-cocoa mlterm."

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--prefix=#{prefix}", "--with-gui=quartz"
    system "make"
    system "make", "install"
    system "cp -pvr cocoa/mlterm.app /Applications/"
    system "mkdir -p /Applications/mlterm.app/Contents/MacOS"
    system "HOME=/Applications cocoa/install.sh #{prefix}"
  end
end
