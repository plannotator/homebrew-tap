class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.5/plannotator-tui-aarch64-apple-darwin"
      sha256 "c5397b9a858b3260bd70ace77627c18e865f67cf5964655de692bf3158757eda"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.5/plannotator-tui-x86_64-apple-darwin"
      sha256 "8343818dcc2fcd5b37355f400cb1c679e5e679fb4e9998b40188745b5bcdce0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.5/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "fd45b4ad8e4dcd21928cdb7790b420f48dcba5a22473fd11a57baf3426ba6cb4"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.5/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "953edd9cf428d3936a150187fd9b48563d4d7df9615e98a509b7ca0274f04b42"
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
