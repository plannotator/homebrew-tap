class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.6.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "096d0c5abda862c173ac7379c606f8909768f43458333ac706bd6ede0424c8b7"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.6.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "caca14bab235dee26417bfa6b49fe70b7bf6b985af9ea4ad4cd6ba24f56cec31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.6.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "4e7391f8a0c815012469675ac69569252eb49cd2b9e9757a5093a6add3a07872"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.6.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "dfa0e6c0eef9ce1ca64ea7b18f37651364a9f1c2c0a615bdd44f898d2446920a"
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
