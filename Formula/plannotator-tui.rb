class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.7.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "b52038baa264a3720d57c9a0e5673db86d5e07b98d639733f9621be88b8f1528"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.7.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "5155af87442fd124c9edf105c48674cfa5633a25be7039652af52bb8dc61674d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.7.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "1948087001e5a02e879fda158668cb559e404534446a078610de799b0b530514"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.7.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "8f814afd63c63100dfd15c7e4c2d5c8924e74943e817880c39c880c2f89c9944"
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
