class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.10/plannotator-tui-aarch64-apple-darwin"
      sha256 "a42ad950f73721bd843cbf6dc060c6a81b062d3450fd40a2600581f64ce31ff8"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.10/plannotator-tui-x86_64-apple-darwin"
      sha256 "9e1991b60729e24813124e9d06d2a6f2e36da50741b03873f02a6ef740d61e85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.10/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "0f21df0e92d27c5e9980ea29e35ed1f53fddae6f344cfd2d0c7265fa634d16dc"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.10/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "d38e94ebb0051d04efb1f4b9fd2bcf2f5b6c0b656ce4a903242ba203be8b0061"
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
