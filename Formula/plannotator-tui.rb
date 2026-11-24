class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.4/plannotator-tui-aarch64-apple-darwin"
      sha256 "bf0ff9ba0819fad297efeba9472fc07b4ba7a48d2d623079dbf968071e480e28"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.4/plannotator-tui-x86_64-apple-darwin"
      sha256 "80d8ee3239cb223956400e3841ac69f2d747be0c171967a36ecbb588b9236515"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.4/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "31fa3b36baa55e47bff087ef682158b0ede829f80f305b31d0e2c0a634b87777"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.11.4/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "4c426ec0cd2b1944c6a3dc6455cd16fee1f259e02cbb662f954eef560ad08f12"
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
