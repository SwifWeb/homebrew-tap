class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.8.2"
    url "https://github.com/swifweb/webber.git", tag: "0.8.2", revision: "28eb4080572cb399934554cb819df1520b77df75"
    sha256 "ccb97f26820d965390eceaf8dcdaa903e65494dcb9d438bba191dd043ee94f5d"
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
