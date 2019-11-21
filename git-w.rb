require "formula"

class GitW < Formula
  desc "It is a subcommand of the git command and displays github.com contribution."
  homepage "https://github.com/redpeacock78"
  url "https://github.com/redpeacock78/git-w.git"
  head "https://github.com/redpeacock78/git-w.git", :branch => "master"
  version '0.0.1'.freeze

  #depends
  depends_on "coreutils"
  depends_on "findutils"
  depends_on "bash"
  depends_on "grep"
  depends_on "git"

  bottle :unneeded

  def install
    bin.install "git-w"
  end
end