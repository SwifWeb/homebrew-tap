class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.7.0"
    url "https://github.com/swifweb/webber.git", tag: "0.7.0", revision: "a5ef2df9e255a3225edfb09b5bc34313ebe9db45"
    sha256 "d316c723384f6d8352827b1414770ee90672b3d95b5da6f76e2e999220b7e27a"
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
