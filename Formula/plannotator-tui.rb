class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.5.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "3e1480d5f8e814a5eeac60cd4bdf0bdcaa7e317ec24e679f0a98babcf564860b"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.5.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "c547a659828bd6ee5b6f65b759817d2eb519bd08642a3fe4222bf461de4526e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.5.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "5e12b8620cb5c01b7ab3c716fdca531dc56d451b7ae1aa9d4f483861098f9336"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.5.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "5b3d8ca3e76410a5fcd87b3ea2564e304a63e7df9d306d2c5c22edcb1e0425ce"
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
