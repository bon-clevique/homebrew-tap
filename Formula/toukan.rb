class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.1.0/toukan-v2.1.0-darwin-arm64.tar.gz"
    sha256 "8c6e7f84f3b960771f498745a25b3d8e0e5154d296d42dc8ad061b0ea9261435"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.1.0/toukan-v2.1.0-darwin-x86_64.tar.gz"
    sha256 "8bc86920ee1b2e890f84c239479542202400ecb509d10387bb246610f7bd6ab7"
  end

  def install
    bin.install "toukan"
    (share/"toukan").install "toukan-claude.md"

    output = Utils.safe_popen_read(bin/"toukan", "--generate-completion-script", "zsh")
    (zsh_completion/"_toukan").write output
    output = Utils.safe_popen_read(bin/"toukan", "--generate-completion-script", "bash")
    (bash_completion/"toukan").write output
    output = Utils.safe_popen_read(bin/"toukan", "--generate-completion-script", "fish")
    (fish_completion/"toukan.fish").write output
  end

  test do
    assert_match "Markdown", shell_output("#{bin}/toukan --help")
    assert_match version.to_s, shell_output("#{bin}/toukan --version")
  end
end
