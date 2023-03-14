class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.6.1"
    url "https://github.com/swifweb/webber.git", tag: "1.6.1", revision: "21610c03107fe1e83991d0d4be54799c23bf499b"
    sha256 "8093addba8c3cd6d7a024aa869d836d53bd0eca989ea6128bf1f93d050a204e9"
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
