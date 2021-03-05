class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.3.3"
    url "https://github.com/swifweb/webber.git", tag: "0.3.3", revision: "5745c042e66b9f0d2059063ab6926bd3941382bc"
    sha256 "38ea0e8a6ee732724ee1caddf0648132680977391c4093056039570906ad267a"
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
