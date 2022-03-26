class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.8.1"
    url "https://github.com/swifweb/webber.git", tag: "0.8.1", revision: "748453ffad9265de893bda3af887f87bf45f456e"
    sha256 "246f0c60001453347589cbfd8dabc23ac1359e668ec0859b9c662d8fc9b01120"
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
