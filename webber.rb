class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.9.0"
    url "https://github.com/swifweb/webber.git", tag: "0.9.0", revision: "fb03c7fa2bd92023c9fd15baae97293a83c8787f"
    sha256 "1db41455860e5ad8234864f1a430b3084330e928d28097a7b8a9b94730bf8664"
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
