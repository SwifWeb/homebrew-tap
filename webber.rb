class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.8.0"
    url "https://github.com/swifweb/webber.git", tag: "0.8.0", revision: "03d6f6637427008664171155440b47b6aa10a7fb"
    sha256 "af1aaa52827f6e284eb428cfeea82e72d8eca89d2e91f618516da537bbd3d595"
  end
  
  depends_on "binaryen"
  depends_on "npm"
  depends_on "wasmer"
  depends_on :xcode => "13.1"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/webber", "webber"
    bin.install "webber"
  end

  test do
    system "webber -h"
  end
end
