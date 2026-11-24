class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.2/plannotator-tui-aarch64-apple-darwin"
      sha256 "9360ced5dc2ecea857a5e0653da403a9b14f8bd161e4cc2af8f07e2ed4bdab86"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.2/plannotator-tui-x86_64-apple-darwin"
      sha256 "e38f7645d670af20a7fcb435abd953e48122087b6936d8de1593af769dd5c301"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.2/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "71e94b54830d7a3b731a61d3e3ba8d211837c85a6e8b84eb6c7ce9deabd569a3"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.2/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "7b072a3b990f25495e8e9997229d81ef2f56651b1d0d447ed8375e6db7020f89"
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
