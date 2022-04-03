class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.9.1"
    url "https://github.com/swifweb/webber.git", tag: "0.9.1", revision: "e30fa505558fe66fa34580a93e73daa94f33eb15"
    sha256 "d43828dcfe9a3296f9c8f3ba20ba55f286c2270bd695ff4b535a2830418aad94"
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
