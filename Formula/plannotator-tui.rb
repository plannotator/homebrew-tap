class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.10.0/plannotator-tui-aarch64-apple-darwin"
      sha256 "b59243348601a6dc173f7b577aba8861eda815f4961c6ae7c062ecd3d74468a2"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.10.0/plannotator-tui-x86_64-apple-darwin"
      sha256 "b000400623d75b0273bff976f66813cb85d9cdc7504b870b7d6457018d82333a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.10.0/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "c974e2d7b64365e21e02e5e91dcf321d45d9d062d9eee30b9b11880e79abe996"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v0.10.0/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "80c7ccf5ab8fedaca94e502521d085fca6760e1e7c04069ad3c4e06b4c7e03e3"
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
