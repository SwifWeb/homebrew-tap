class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.6.2"
    url "https://github.com/swifweb/webber.git", tag: "1.6.2", revision: "2ebc46af0c2c417debf2d3af0330b11ce2d00b87"
    sha256 "8fbdc31a211da5dd0329fb279792e1ed957354f0ceb1b05ec3e9414aa94f4665"
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
