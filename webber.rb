class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.4.0"
    url "https://github.com/swifweb/webber.git", tag: "1.4.0", revision: "dab12ec19039bc2d68779c0c7a845f23e1b136b6"
    sha256 "4e18e3f0171c96779a429bd88ebfe151016cb99e464c3695bd8da98c907814b4"
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
