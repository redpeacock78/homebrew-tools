require "formula"

class Pciutils < Formula
    desc "The PCI Utilities."
    homepage "https://mj.ucw.cz/sw/pciutils/"
    url "https://github.com/pciutils/pciutils.git"
    head "https://github.com/pciutils/pciutils.git", :branch => "master"
    version "3.6.4".freeze

    #depends
    depends_on "pkg-config" => :build

    def install
        system "make", "PREFIX=#{prefix}", "SHARED=yes"
        system "make", "install", "install-lib"
    end
end
