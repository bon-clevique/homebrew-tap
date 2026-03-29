class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.0.0/toukan-v2.0.0-darwin-arm64.tar.gz"
    sha256 "ce159170cec45bcdb6929e6832db09641d2f2a612ef2aa6c4293d93de50c3add"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.0.0/toukan-v2.0.0-darwin-x86_64.tar.gz"
    sha256 "f6cf86fe026183b4a0ed309d6f5596034d25c525fa75501e16d78bf2985a22bf"
  end

  def install
    bin.install "toukan"
  end

  test do
    assert_match "Markdown", shell_output("#{bin}/toukan --help")
  end
end
