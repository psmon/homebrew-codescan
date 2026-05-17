# typed: false
# frozen_string_literal: true

# CodeScan Homebrew formula (template).
#
# v1 distribution lives in the `psmon/homebrew-codescan` tap:
#
#     brew tap psmon/codescan
#     brew install codescan
#
# The release workflow (or a manual update) rewrites VERSION + the two SHA256
# placeholders before pushing this file to the tap repo at
# `Formula/codescan.rb`.

class Codescan < Formula
  desc "CLI/TUI/GUI source-code scanner with FTS5 search and git blame"
  homepage "https://github.com/psmon/CodeScan"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/psmon/CodeScan/releases/download/v#{version}/codescan-osx-arm64.tar.gz"
      sha256 "48330311ee35e36d4f3eb6656b9196b1058e125dddf8b1dc4c334377b7c9d210"
    end
    on_intel do
      odie "CodeScan v1 does not ship an Intel Mac binary. Build from source or use Rosetta with the arm64 build."
    end
  end

  def install
    # Homebrew auto-enters the single top-level directory inside the tarball
    # (our tarball ships `codescan/{codescan, VERSION, README.md}`), so paths
    # here are relative to the inner `codescan/` directory.
    bin.install "codescan"
    pkgshare.install "VERSION" if File.exist?("VERSION")
    doc.install "README.md" if File.exist?("README.md")
  end

  def caveats
    <<~EOS
      CodeScan stores user data under ~/.codescan/ (db, logs, config).
      This directory is preserved across upgrades and uninstalls.

      The v1 binary is not notarized. If macOS Gatekeeper blocks first run:
        xattr -d com.apple.quarantine #{bin}/codescan
      or allow it from System Settings → Privacy & Security.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codescan --version")
  end
end
