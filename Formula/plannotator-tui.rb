class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "7757b8980db88fef20fe8e7b01701f4d2a5298f9ceb63fc87211e5a79140f5ae"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "445d35b9aaba65b9738be43c1f1caea78ce8dd81c64e96e2d795033b5e6166d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "362dab310574c5efc531ae329ad08f7c5b57f4babb96df2e17bc28ed04eacf08"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "92a19c4c50cbde846fb78a52b320eeea8332a74ff31a1648d560fcdc2fb3beda"
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
