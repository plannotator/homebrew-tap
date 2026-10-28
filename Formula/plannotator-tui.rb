class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.8/plannotator-tui-aarch64-apple-darwin"
      sha256 "01509db7767796dcffa766b34d7c2e70d90e4e2865323f606823c18cf1715c98"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.8/plannotator-tui-x86_64-apple-darwin"
      sha256 "dc94b5f93936c981e5c59d4ad55e534ecc51e83351c27fc2ae32d415b3358956"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.8/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "47af5ab2bb37a747bda7785f3d0899713b7a05ea94f8bcff66a35f011055bc57"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.8/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "a4b6bfce26d2e33cd3ef4eb4b78e42205694dce3927fab835a71f0093611153e"
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
