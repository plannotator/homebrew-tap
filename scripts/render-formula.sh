#!/usr/bin/env bash
# Regenerate Formula/plannotator-tui.rb for a published plannotator-tui release.
#
#   scripts/render-formula.sh 0.3.0
#
# Reads the release's SHA256SUMS as the single source of truth for checksums.
set -euo pipefail

version="${1:-}"
if [ -z "$version" ]; then
  echo "usage: $0 <version, e.g. 0.3.0>" >&2
  exit 2
fi
version="${version#v}"

repo="plannotator/plannotator-tui"
sums_url="https://github.com/${repo}/releases/download/v${version}/SHA256SUMS"
out="$(cd "$(dirname "$0")/.." && pwd)/Formula/plannotator-tui.rb"

sums="$(curl -fsSL "$sums_url")"

sha256_for() {
  local asset="$1" sha
  sha="$(printf '%s\n' "$sums" | awk -v a="$asset" '$2 == a { print $1 }')"
  if [ -z "$sha" ]; then
    echo "error: no sha256 for '$asset' in $sums_url" >&2
    exit 1
  fi
  printf '%s' "$sha"
}

macos_arm="$(sha256_for plannotator-tui-aarch64-apple-darwin)"
macos_intel="$(sha256_for plannotator-tui-x86_64-apple-darwin)"
linux_arm="$(sha256_for plannotator-tui-aarch64-unknown-linux-gnu)"
linux_intel="$(sha256_for plannotator-tui-x86_64-unknown-linux-gnu)"

cat > "$out" <<EOF
class PlannotatorTui < Formula
  desc "Annotate Markdown in the terminal and send the review to your agent"
  homepage "https://github.com/plannotator/plannotator-tui"
  license "MIT"

  # Homebrew reads the version from the release URLs below.
  # sha256 values come from the SHA256SUMS asset of the matching release.
  on_macos do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v${version}/plannotator-tui-aarch64-apple-darwin"
      sha256 "${macos_arm}"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v${version}/plannotator-tui-x86_64-apple-darwin"
      sha256 "${macos_intel}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v${version}/plannotator-tui-aarch64-unknown-linux-gnu"
      sha256 "${linux_arm}"
    end

    on_intel do
      url "https://github.com/plannotator/plannotator-tui/releases/download/v${version}/plannotator-tui-x86_64-unknown-linux-gnu"
      sha256 "${linux_intel}"
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
EOF

echo "wrote $out (version ${version})"
