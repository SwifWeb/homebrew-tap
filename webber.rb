class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.3.1"
    url "https://github.com/swifweb/webber.git", tag: "0.3.1", revision: "4f4cc6d20ea250a00b6bc7e66d209be2518c43bf"
    sha256 "ddfe26115c82eae6cc84181eae27a8a5ff08cd7c54fc97accd87765f21269c3e"
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
