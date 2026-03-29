class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/v2.0.0/toukan-v2.0.0-darwin-arm64.tar.gz"
    sha256 "b22695a1d761c8c70d946f270bcdf6c2ab96f41557c5b9d56007e69c1c61df3d"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/v2.0.0/toukan-v2.0.0-darwin-x86_64.tar.gz"
    sha256 "47206d3122cb5ac5754ad2810e153427c608c3350bf4079233e9a2b2bd7ed67c"
  end

  def install
    bin.install "toukan"
  end

  test do
    assert_match "Markdown", shell_output("#{bin}/toukan --help")
  end
end
