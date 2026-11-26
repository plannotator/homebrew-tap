class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.12.1/plannotator-tui-aarch64-apple-darwin"
      sha256 "a5baa8ebc2b20437709bb013774d70203ab5baba725c9977fe21fffaac36de6c"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.12.1/plannotator-tui-x86_64-apple-darwin"
      sha256 "2f4998d01498fc267fea289c0d24d6b7c0776b0187ea9a841d3d9b8cf1f5f061"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.12.1/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "ad3ee6d93f46b8c57f1ff891a4b841a8524d74d3128c1ab88fc1ec4d89b8c34f"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.12.1/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "8c403377f8a6643c9f21182353a1d52a8d128a15a9e8fa72680a483eeb0fb52c"
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
