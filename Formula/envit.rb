class Envit < Formula
  desc "Declarative repository context and skills for coding agents"
  homepage "https://envit.dev"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  # sha256 values are filled from the GitHub release assets for this version.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/envit/releases/download/v#{version}/envit-aarch64-apple-darwin.tar.gz"
      sha256 "PENDING_RELEASE"
    end
    on_intel do
      url "https://github.com/plannotator/envit/releases/download/v#{version}/envit-x86_64-apple-darwin.tar.gz"
      sha256 "PENDING_RELEASE"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/envit/releases/download/v#{version}/envit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "PENDING_RELEASE"
    end
    on_intel do
      url "https://github.com/plannotator/envit/releases/download/v#{version}/envit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "PENDING_RELEASE"
    end
  end

  def install
    bin.install "envit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envit --version")
  end
end
