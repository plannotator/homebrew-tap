class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.12.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "08be2ea6e425af32c56cadd7b96555a1a0e083f94cfc7eb1af2bf09494f2c598"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.12.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "d5af202a2eeafc898719b4311f83ac7528540a36471fb78b5c4c37c6c741bafb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.12.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "f2680e351c66d31e5fe634c80f62f7fcb9e28fafdee0af34b1028471fc972890"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.12.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "93892f416c1948db086a3e5e68d8c93da4c63824efa1f66f6f17fa084537c238"
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
