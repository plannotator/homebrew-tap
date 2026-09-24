class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.3/plannotator-tui-aarch64-apple-darwin"
      sha256 "400a3e2981a6911b10d84a0e8f952bf5a77d535cc65b853e84cd0f27767519da"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.3/plannotator-tui-x86_64-apple-darwin"
      sha256 "fa258ff920167407722bb22f8e596c21f308abe55d9127a401ff6584404e4302"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.3/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "3317df1af0d15e500d156daff331ca42b1bc8ebf088af28d17dba2b3d9c81bb6"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.3/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "2bb7eff9e7c5bf38f2b196b20081ba323a9957e3ec61b84cfeacb94dc331deb1"
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
