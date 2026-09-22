class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.2/plannotator-tui-aarch64-apple-darwin"
      sha256 "79c8801babac5cd257034036536bbcf51a7b4cd8d06b437f1e85713714521eb0"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.2/plannotator-tui-x86_64-apple-darwin"
      sha256 "36ef05666c066db7c32759c8d6eebe62237117b88748818463fa2acf94ef5834"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.2/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "ef579f63c24bbe474019be3cc5cc5a5bd0541eb79391b190957e50ab6ea0edb3"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.2/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "874ecabaa35e3ace549d5bf3c7383fa4d1288ba06b36e9f04eb4f4b7b55229a5"
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
