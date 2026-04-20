class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.2.5"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.2.5/toukan-v2.2.5-darwin-arm64.tar.gz"
    sha256 "8dcace6252139020103f6691e613c1ee3cf2a429c2fc1fa3b858bbffe378bb53"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.2.5/toukan-v2.2.5-darwin-x86_64.tar.gz"
    sha256 "deba6ca008b0cb934d746ff8db0004bfddcb9313918aa9a5d59a691994c0d006"
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
