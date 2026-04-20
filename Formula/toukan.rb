class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.2.6"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.2.6/toukan-v2.2.6-darwin-arm64.tar.gz"
    sha256 "2e6d60dc7b8aefc341a0ccaa4df9aba5c15022c421cb266790093271964df66d"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.2.6/toukan-v2.2.6-darwin-x86_64.tar.gz"
    sha256 "feefaa9dc9d352a698497f7d51bebc70182111e865c60a070793a766ad90ab77"
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
