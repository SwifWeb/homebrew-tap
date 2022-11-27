class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "1.1.0"
    url "https://github.com/swifweb/webber.git", tag: "1.1.0", revision: "a3b3f8e147b8621ba3c21b57b4f5434b17754380"
    sha256 "2675c3d39f66a359005f543fa1edaafab7697c4981f607d444b3cd0beb63ae09"
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
