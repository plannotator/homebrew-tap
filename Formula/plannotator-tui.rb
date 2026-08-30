class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.4.1/plannotator-tui-aarch64-apple-darwin"
      sha256 "8e57fc562a28a6819028dda1fb87979bbac4b22df0d7f6d9a228b43edf6922b5"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.4.1/plannotator-tui-x86_64-apple-darwin"
      sha256 "e13e45c6e00e39948ac6a9c33f57bd6df7294c10dbcc6655a27b0ccfcbd91fcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.4.1/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "fb42d9a26dec4ecc3b8ca5f4bd53e7795bd464a6169592c9773ace6a12917bbe"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.4.1/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "3f7dfb226440e58d2b30e921cabcf82eaec50cd25cf4996ca0750f674b1e82a1"
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
