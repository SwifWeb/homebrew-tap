class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.2.0"
    url "https://github.com/swifweb/webber.git", tag: "0.2.0", revision: "2c02e9e3fcde3f6d29f28c2c2289e0e487e7c723"
    sha256 "fbe25682215fcd5b42f4f4cdbd86de046427310c27af19aaaaeeeec69956baec"
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
