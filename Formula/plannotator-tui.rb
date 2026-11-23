class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.1/plannotator-tui-aarch64-apple-darwin"
      sha256 "ee8ab50a15a879278c4a4c98c05040957e2cc4cba4fb2cf46f6009aeb1b0af4a"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.1/plannotator-tui-x86_64-apple-darwin"
      sha256 "9e3339d698202a79cf2a367ced19a42d4dbdd47b9213f30a4abeef79dd7ffc00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.1/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "83d44018ff3254633532b39ad0b933c60e1fee76ceaaa62e05dafa200c0d2bb7"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.1/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "24d0709ca312772324e51fb6011a8730af2ec807954c3908f69b23f463191a0c"
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
