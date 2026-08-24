class Envit < Formula
  desc "Declarative repository context and skills for coding agents"
  homepage "https://envit.dev"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  # sha256 values are filled from the GitHub release assets for this version.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/envit/releases/download/v#{version}/envit-aarch64-apple-darwin.tar.gz"
      sha256 "c1aac713fe2b67267279407de1e9c6d7ccb56da2bf78d7f74f66909da5c67331"
    end
    on_intel do
      url "https://github.com/plannotator/envit/releases/download/v#{version}/envit-x86_64-apple-darwin.tar.gz"
      sha256 "5266be3c314f5b2984e0771c051bb7c002c3260ec96e8553f3eb356ea1b245f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/envit/releases/download/v#{version}/envit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "35397d2f61ea8777b7fe3cb019db29c3b0aba3f53be34eadaa5181896ad92a27"
    end
    on_intel do
      url "https://github.com/plannotator/envit/releases/download/v#{version}/envit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "03f15ee990d697fc2aab7f047e6259193b88b679a324911030c5c0e0b2503598"
    end
  end

  def install
    bin.install "envit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envit --version")
  end
end
