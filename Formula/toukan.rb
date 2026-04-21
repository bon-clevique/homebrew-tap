class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.3.2"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.3.2/toukan-v2.3.2-darwin-arm64.tar.gz"
    sha256 "f425d4790d817ba303dae03772d34cc895b8a8ad5458b43f7628d74e58a3c91a"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.3.2/toukan-v2.3.2-darwin-x86_64.tar.gz"
    sha256 "a6eb1330749f817db9d9d1a3e3ea1b9ed6ecce00e4a612a475bd5e7908c8b202"
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
