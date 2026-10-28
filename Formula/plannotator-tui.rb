class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.7/plannotator-tui-aarch64-apple-darwin"
      sha256 "a6e3bc6e35662aa56797a31dc4ccf7bba2252330da6f4f11dba8632c91d4fb54"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.7/plannotator-tui-x86_64-apple-darwin"
      sha256 "0804779c79910f58adf35d7102b7e72c4b89eaf275d6f5922c60e2f3eba48493"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.7/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "08633cb7c536d9aa3d3efbeaf2891afe377192a66b5b5aa22b1499738440deb8"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.7/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "9dca21d8926f399c26968331c52315c729c049de4756881afba659bbc23505a6"
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
