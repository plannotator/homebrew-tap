class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.2/plannotator-tui-aarch64-apple-darwin"
      sha256 "0dd6d4c223b78bf520b72db9c0ac923228a3b4935e7aa5088902c1885143ea55"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.2/plannotator-tui-x86_64-apple-darwin"
      sha256 "cddf9e9c85921a6a2a636515ae1d58f4de4336041f65396de1c9cc3c286b1f62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.2/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "198c9785abbc7647f9c36812a3261d1feee237e3d2c61fec5f0ab8bbf9869f5f"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.2/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "4b111249070e41cf2bbb2b5b8d367649f16c5c736f30bd00d12e1db44f1caf9c"
    end
  end

  def install
    # The release asset is a bare binary, so exactly one
    # plannotator-tui-<target> file is staged for this platform.
    bin.install Dir["plannotator-tui-*"].fetch(0) => "plannotator-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plannotator-tui --version")
  end
end
