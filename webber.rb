class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.1.1"
    url "https://github.com/swifweb/webber.git", tag: "1.1.1", revision: "ca79fe8a0c1d743ca45616ccaac17107d9d8f5d9"
    sha256 "c3e1163049dc5c1cf05d6278e205e6d3eda4194cb573cdf3127e49cbc4b60001"
  end
  
  depends_on "binaryen"
  depends_on "npm"
  depends_on "wasmer"
  depends_on :xcode => "14.0"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/webber", "webber"
    bin.install "webber"
  end

  test do
    system "webber -h"
  end
end
