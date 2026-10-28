class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.6/plannotator-tui-aarch64-apple-darwin"
      sha256 "0b09da1164f49d0eb686c74b2ee90fb12414baad3a45e0efa7c4941084ee862e"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.6/plannotator-tui-x86_64-apple-darwin"
      sha256 "04c4d4236f86c0841a6bfdf5270617cfe326059a2a64a3d9b264b507d932d99f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.6/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "8b18a3baada87791d8a613b84c6b7e1f00e1eb2591e9f166771958bca3ade251"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.6/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "b2c9d1b02189d9af3995e4af2157d9a1946e8a44d6c83332f76a63ceb4a9e79c"
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
