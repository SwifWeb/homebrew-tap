class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.7.1"
    url "https://github.com/swifweb/webber.git", tag: "1.7.1", revision: "c9fa362ba12f5d5d5bc7d44627dc2e8e49c991c6"
    sha256 "8d8a16cdf7cdf5bcf1001e0bca73f90965c4ac09fcffebb40255d5e4fc70a45a"
  end
  
  depends_on "binaryen"
  depends_on "npm"
  depends_on "wasmer"
  depends_on :xcode => "15.0"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/webber", "webber"
    bin.install "webber"
  end

  test do
    system "webber -h"
  end
end
