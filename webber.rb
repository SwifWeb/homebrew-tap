class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.8.1"
    url "https://github.com/swifweb/webber.git", tag: "1.8.1", revision: "300af56492fae34fb6b575c25ced771d533e33a8"
    sha256 "85b4fbfd448da0ea08bfa5d338564ab05d3d895dcbf6bac62371ce4f7d49be9b"
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
