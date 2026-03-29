class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  url "https://github.com/bon-clevique/Toukan/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    cd "CLI" do
      system "swift", "build", "-c", "release", "--disable-sandbox"
      bin.install ".build/release/toukan"
    end
  end

  test do
    assert_match "Markdown", shell_output("#{bin}/toukan --help")
  end
end
