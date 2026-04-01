class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.0.1/toukan-v2.0.1-darwin-arm64.tar.gz"
    sha256 "d20e4af5f0bd34367725e5af521771e5ccf3d222e4e6a9e3a03977ce279d868a"
  end

  on_intel do
    url "https://github.com/bon-clevique/homebrew-tap/releases/download/cli-v2.0.1/toukan-v2.0.1-darwin-x86_64.tar.gz"
    sha256 "f52146a02fc36a39144cc4733e2771f876e632f7d522b7e2e9fac5215619c414"
  end

  def install
    bin.install "toukan"

    # Generate shell completions
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
