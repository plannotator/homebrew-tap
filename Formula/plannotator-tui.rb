class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.4.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "7a8c2af68a6b0c2a1c76bbbac6c65f340b67e0f1bbdd04f099b1e81f44c741bb"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.4.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "8c1dc3457e173c0e159eaa7b7d2319b07e96d9ee69b5ba95b8f80f7b592564b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.4.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "974947d49e164a07c003e118c82e194d88d0c4b413a3d226e335a688d6fbf14f"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.4.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "2e225d08f34165a44301857dc5a00fbfa7c2f679a0d783e1a247ce19aa7b113e"
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
