class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.0.0-final/toukan-v2.0.0-darwin-arm64.tar.gz"
    sha256 "9db4cb70e0fe9b7e95deefedb36b81640b3c6c7c311b3d3163172144e18f4c90"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.0.0-final/toukan-v2.0.0-darwin-x86_64.tar.gz"
    sha256 "47781a6a59758a896fcbebf25813a2aea3ff5648c223448353b72078fca955e1"
  end

  def install
    bin.install "toukan"
  end

  test do
    assert_match "Markdown", shell_output("#{bin}/toukan --help")
  end
end
