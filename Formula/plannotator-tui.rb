class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.8/plannotator-tui-aarch64-apple-darwin"
      sha256 "f909b2ef6cba7f8c30f1c96a47449f4eb594967154690c0918525c0e8f0bb030"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.8/plannotator-tui-x86_64-apple-darwin"
      sha256 "dd7533dafa929ecf37150d3193790ac1c57948096da64081c9d75139e05011a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.8/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "0ce89a5a2537b07ed90912b02c39f6eb2263bb9d8c528f362ecc1b091927d02e"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.8/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "023bf65c3b6f8e8c3817395bbbc1ea140a503060f9407ad55248dbd8690a05bf"
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
