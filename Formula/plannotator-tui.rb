class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.3/plannotator-tui-aarch64-apple-darwin"
      sha256 "3a9be4956aee2d0e98df4b457c77b84a1efab7b764cf2937df2f5e9e390bf90e"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.3/plannotator-tui-x86_64-apple-darwin"
      sha256 "6c8c803fd84d045a3b4ab1b384d0ff168ec1a09984fbcfb5ea2d6cc0a5a15e8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.3/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "1dcc52f512a76c4e2ba89751985d5efc614cd8664649acb4a04477f1138b4ae2"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.3/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "05224d9c88409b157781adec078c9b1cf167589a41b75daba91bb7bd58019f65"
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
