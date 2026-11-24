class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.6/plannotator-tui-aarch64-apple-darwin"
      sha256 "7c180ac17ce40568ff057d8be28eaac3c2d557e1c69d7044cc48303c7157e243"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.6/plannotator-tui-x86_64-apple-darwin"
      sha256 "a18c1981096cc0957e8ad613c3084bd220c5eb35a65ddf66d9b8a6071bf394d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.6/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "35f9fcaf2bcc4b08e769926e72643f7c19123cbf20855b889956f431b535f052"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.6/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "14ba49b0afeb711b2f83cf010be15bb043d53045f5ebecd75f80cffb8d70dfad"
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
