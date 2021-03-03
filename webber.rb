class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.3.0"
    url "https://github.com/swifweb/webber.git", tag: "0.3.0", revision: "f56bee6a17340c0431efa6992c1923be5463a328"
    sha256 "3a2773089cde0864761d9f00ae362ebe4420fa66ababb44665f3302c1e6f7604"
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
