class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.5.1"
    url "https://github.com/swifweb/webber.git", tag: "0.5.1", revision: "fd4087cd77160540efedc9af6dbc0577e672f031"
    sha256 "377a230764ddc6d3c26ebdd252004ce82f2efc459224729b534da51bb69809ce"
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
