class Webber < Formula
  desc "Console tool for your swifweb apps"
  homepage "https://swifweb.com"
  head "https://github.com/swifweb/webber.git"

  stable do
    version "0.4.0"
    url "https://github.com/swifweb/webber.git", tag: "0.4.0", revision: "575b4ec2b2e695e623d0c297e092a5fc957f95f6"
    sha256 "b77c35a0ad4f02fd0c918c8d31f62ca4f3d0091e6c02efaff69e873f0f805b52"
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
