class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.8.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "7d057f3a1a3aa23cb0a44843fed3f04d498a1da52197cdec0212c6f8e1618cb2"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.8.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "6b6084d16ed8aa09915892f907e58186a6ec69c560752cff9d042bdcbb62820f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.8.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "23f91e5b1e5d04a1ac41f1d8f50ebf4c20f0461141952862972a630ef690e18e"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.8.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "faa6513ad1a4757a2861e95570168f2c8118f219b7e8d6a5175a008fe234fe0b"
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
