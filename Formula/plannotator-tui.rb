class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.1/plannotator-tui-aarch64-apple-darwin"
      sha256 "aa2b283dee3c5e090ded02e2dfa4d53c8c4fe0d1b8d9d702ec4936f5efeff09c"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.1/plannotator-tui-x86_64-apple-darwin"
      sha256 "70a9d61e68eb13df8c8bc6183ee328b0e6236b649a44c84766fd7cd9832304a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.1/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "d3716057e821cbea431fcf9efc32fc6924e884e685aba9c98d175753ca07f2b2"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.1/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "c64b6caca1847c159af0d9a1881a115f5de689f69ce752595c99ea69a839c3e0"
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
