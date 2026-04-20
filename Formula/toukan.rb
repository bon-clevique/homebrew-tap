class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.3.0/toukan-v2.3.0-darwin-arm64.tar.gz"
    sha256 "8c92e80d5c3b507c9cd36b7f65f20191f68ed391f866a03384ef797601dbf319"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.3.0/toukan-v2.3.0-darwin-x86_64.tar.gz"
    sha256 "a2fc51a64cfed4004cf27abd9ea3ddcf1fa66e24324146ac9fcbeed1dad6cc3a"
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
