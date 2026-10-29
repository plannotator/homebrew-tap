class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.9/plannotator-tui-aarch64-apple-darwin"
      sha256 "7e1df874dd905fb85c82e9db4750d1ab64009d4380173ea67bbcb0e4bc9d525b"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.9/plannotator-tui-x86_64-apple-darwin"
      sha256 "68b0f974bf14d211a3e2a8e001ff3cf47dcad3bbb90eed0c9b419473ad4eabaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.9/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "56069a79dbf245837b723344784645aa7900bacde5c78ed27dcf6d1160837161"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.9/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "06d403e0742b5aaf16a341ba0104f8b854f1f0ae133b70f63d11880b148d4e18"
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
