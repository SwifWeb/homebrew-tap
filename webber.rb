class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.3.2"
    url "https://github.com/swifweb/webber.git", tag: "0.3.2", revision: "4fb1d430ca945b270f47597d3454607d88875350"
    sha256 "f77e0ca4601bbc2b33279e4965080c150ab051b4787d39b3ea0cee0f10f6eaf1"
  end
  
  depends_on "binaryen"
  depends_on "npm"
  depends_on "wasmer"
  depends_on :xcode => "11.4"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/webber", "webber"
    bin.install "webber"
  end

  test do
    system "webber -h"
  end
end
