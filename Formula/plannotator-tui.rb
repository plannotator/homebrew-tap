class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.5/plannotator-tui-aarch64-apple-darwin"
      sha256 "79c68f028b70e1c3070e331187180e6c40ae91d13bf9732f917448197326d4f6"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.5/plannotator-tui-x86_64-apple-darwin"
      sha256 "82d55a01daff7d4bc25919db0f3a62e8a47daad43db856ffcd2aff271771a068"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.5/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "c3463a24aa7b0aea498294907b195ed2bd805bd85e37f7c525e9549170c6520c"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.5/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "e3c3e811a4ae57f49e44abb3fe450f3ed414ca2a3b5ad098550274e56d81a528"
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
