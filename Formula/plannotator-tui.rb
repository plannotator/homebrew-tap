class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  version "0.2.0"
  license "MIT"

  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v#{version}/plannotator-tui-aarch64-apple-darwin"
      sha256 "60ecd17e50df5c0c5684174bd4146d9531da672e81ea168eb921f1e0e7f219aa"

      def install
        bin.install "plannotator-tui-aarch64-apple-darwin" => "plannotator-tui"
      end
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v#{version}/plannotator-tui-x86_64-apple-darwin"
      sha256 "1ef4fef78f9c6eb51055394b34b19503d2d3b6872380f3adf495cd5bf666388e"

      def install
        bin.install "plannotator-tui-x86_64-apple-darwin" => "plannotator-tui"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v#{version}/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "9158cfaf4461b098dc873d7141ce53667e7c065fc90b4ea56dd4e7d4b665daab"

      def install
        bin.install "plannotator-tui-aarch64-unknown-linux-gnu" => "plannotator-tui"
      end
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v#{version}/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "772ccaa339df9720313a350d935fd591800fbf57848efa6c2d8d3de6d3a65072"

      def install
        bin.install "plannotator-tui-x86_64-unknown-linux-gnu" => "plannotator-tui"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plannotator-tui --version")
  end
end
