class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.7/plannotator-tui-aarch64-apple-darwin"
      sha256 "dedc47a0446192de35bdb727bb522465e65fee8277a5b507499edb85fb4e4013"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.7/plannotator-tui-x86_64-apple-darwin"
      sha256 "217a9123bba7aa5a0dc566ec911acbdb21202c5521fd6eb694da87eabc10ba2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.7/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "e111b9d7757a29babd24f68d1b389cdda8fb5e2ce3e6c04d2f80ce59223da05d"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.7/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "ad12beb671bc8e05656971340a428fd9949f10583e730da911cea3fa1f6acbbf"
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
