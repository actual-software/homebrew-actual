class Actual < Formula
  desc "ADR-powered AI context file generator"
  homepage "https://cli.actual.ai"
  version "0.13.0"
  license "UNLICENSED"

  on_macos do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-arm64.tar.gz"
      sha256 "49e40128b878926ef95acda1b4363d477f78233289ee7108aeed86b48688ba94"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-x64.tar.gz"
      sha256 "a5dfb8a53521cd4372289084df5ec980bf83f2d431a198d500774af822d97e13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-arm64.tar.gz"
      sha256 "dad1fdbfc51afd8c37f553aca271ea4c6f23f919abfd57f8f2f9ab6452b27c3f"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-x64.tar.gz"
      sha256 "1189a72a6ea89afb384862e38c05752c931b9853e0002b5f777720c49887ce7d"
    end
  end

  def install
    bin.install "actual"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/actual --version")
  end

  def caveats
    <<~EOS
      Apple-approved code signing is on the way — our Apple Developer
      application is currently under review.

      If macOS Gatekeeper blocks the binary on first run, unquarantine it:
        xattr -d com.apple.quarantine #{HOMEBREW_PREFIX}/bin/actual
    EOS
  end
end
