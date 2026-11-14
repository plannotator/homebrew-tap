class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.11/plannotator-tui-aarch64-apple-darwin"
      sha256 "3360a0a24acee284d4cf116244aea92051e11d220027da510c0874f6455b69aa"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.11/plannotator-tui-x86_64-apple-darwin"
      sha256 "2f878ced29ca78135c4eea3f7eee9961e0bbc09f693cc5e7a442f8ced6231bcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.11/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "d6b424dc95c3aa04d6351318e3aeab6fd1f36ddc2f17d6ab68a45e9e0c6a4e97"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.9.11/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "177ca1c3eadd494349bcc9bfafc80864e9e6313671cdd4b83d52316dad99b4b9"
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
