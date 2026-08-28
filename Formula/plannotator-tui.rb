class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "e0d7539cbbfd235444442c23e7716a1e09a4ab5964c547b9b92eaaa154ee90f8"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "dd9fae1f9649b64d9accd739a8c6032fb8be745c749e9db22596e07d367cc49e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "df1b39fb2cd4a423ea306236e8a51073765277f2a0bd4c4219c0aeedaa057272"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.3.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "41d7c8f8e4b10e3fb4d3ce569cd3ddec7a36bd6df1f97dbce4d0277abbba0fdb"
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
