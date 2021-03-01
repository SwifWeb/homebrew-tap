class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.1.0"
    url "https://github.com/swifweb/webber.git", tag: "0.1.0", revision: "3420b50a361e839837af8230da24d539801e9f78"
    sha256 "c4bb57c5e8094965eaa56b038fbe3b0795d3272edeb224a67635ff70bde750d1"
  end

  depends_on "binaryen"
  depends_on "wasmer"
  depends_on :xcode => "12.3"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    system "mv", ".build/release/webber", "webber"
    bin.install "webber"
  end

  test do
    system "webber -h"
  end
end
