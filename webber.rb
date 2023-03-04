class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.6.0"
    url "https://github.com/swifweb/webber.git", tag: "1.6.0", revision: "2b43cac5a5de0bb77e83910a411210d9cae88552"
    sha256 "49e44e98c89bb328cb163e088e7e97b1cfd1f4bbd785cd2ee64a4354bf59eabe"
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
