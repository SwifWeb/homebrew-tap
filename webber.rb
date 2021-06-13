class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.5.0"
    url "https://github.com/swifweb/webber.git", tag: "0.5.0", revision: "e33eef8273f11dd30928c08ac224dc2dd54b9c94"
    sha256 "e25e9aa9466d6c158a23b25a3146a4b9d9882fa1beb5cd4f78d33cc2a0a36d04"
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
