class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.5.0"
    url "https://github.com/swifweb/webber.git", tag: "1.5.0", revision: "75bb31080c135410ff4ba1e7fe0b6a73ea95315d"
    sha256 "c3446d579521f55fdf20a3fcdad8c4e31f808357a94cf18f3a293c27d4c37adf"
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
