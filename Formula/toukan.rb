class Toukan < Formula
  desc "Markdown → Notion sync CLI"
  homepage "https://github.com/bon-clevique/Toukan"
  version "2.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/bon-clevique/Toukan/releases/download/v2.0.1/toukan-v2.0.1-darwin-arm64.tar.gz"
    sha256 "51989985c60b8fbf95cac8114c0544edebe0c496eab1bdede1ca47bc779cd27c"
  end

  on_intel do
    url "https://github.com/bon-clevique/Toukan/releases/download/v2.0.1/toukan-v2.0.1-darwin-x86_64.tar.gz"
    sha256 "64991661720c91d7548fd5d768c7acded97023538334d00367ad769375c40570"
  end

  def install
    bin.install "toukan"

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
