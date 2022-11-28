class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.3.0"
    url "https://github.com/swifweb/webber.git", tag: "1.3.0", revision: "31bff75bd71c463eda21836bc92908f7f18f2de4"
    sha256 "875dcfea5160692d40140e14edf6396e47d4dd786468a36971d2db5ed65c304e"
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
