class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.4/plannotator-tui-aarch64-apple-darwin"
      sha256 "a9da49dd6a44d3494fed0e8366ca32996ecdf40e0271fced410cec3c8839175d"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.4/plannotator-tui-x86_64-apple-darwin"
      sha256 "5d19683d6f90a4249ffaf3a6a7ed0ba1325a136a795c7b11a8ba1fb16fe8d14f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.4/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "e39077aac2e1e77ed798d2590f845cf998e456fa2a212fe7cae2e25febf62082"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.4/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "d54dc603c95f710677bc13ebe6b24b2e6eb10ce761577af8a95a05002862b74d"
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
