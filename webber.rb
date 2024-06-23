class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.8.0"
    url "https://github.com/swifweb/webber.git", tag: "1.8.0", revision: "889d64cea562e5e3332b6a37e922b674fccca2ea"
    sha256 "053f3aefb0b07ba114d01c47e8c98815ba9876d9afde3940350d4cfd66c9fcdb"
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
