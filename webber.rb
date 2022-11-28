class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.2.0"
    url "https://github.com/swifweb/webber.git", tag: "1.2.0", revision: "c1b0d19ad89c0825c3e5ddc8a82412ec875d6e24"
    sha256 "b8705a4a1683514ef5c861e914c316739243ae79de61b281129cfe54fdb73ace"
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
