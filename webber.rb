class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.7.0"
    url "https://github.com/swifweb/webber.git", tag: "1.7.0", revision: "06302df3156a673cf50d8f0be5ba48739fb5785b"
    sha256 "aed327d75ad74423ee69fab97be2793cdc6a583f81fc01a47a6cd9d1c97bf370"
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
