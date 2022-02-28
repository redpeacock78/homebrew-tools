require "formula"

class Yaftx < Formula
	desc "yaft is simple framebuffer terminal emulator for minimalist (living without X)."
	homepage "http://uobikiemukot.github.io/yaft/"
	url "http://uobikiemukot.github.io/yaft/release/yaft-0.2.8.tar.gz"
	head "https://github.com/uobikiemukot/yaft.git", :branch => "master"
	sha256 "5dfdf0c12d64638527eef4df9b17151c7c60bcc006ab976583de71a792083556"

	depends_on "libx11"

	def install
		ENV['LANG'] = 'en_US.UTF-8'
		system "make", "yaftx"
		system "make", "installx"
	end
end