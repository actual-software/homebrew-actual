class Actual < Formula
  desc "ADR-powered AI context file generator"
  homepage "https://cli.actual.ai"
  version "0.6.1"
  license "UNLICENSED"

  on_macos do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-arm64.tar.gz"
      sha256 "32fabd32f252b8aabb035e1b77192adaf937d1d5e6b5c2005bc37bfc4634c371"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-x64.tar.gz"
      sha256 "02d82b3b2c36557683a943c7799c75e1b8995ca25723576624462fba70369550"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-arm64.tar.gz"
      sha256 "d79c57e2d336489ffa6e7081d0b32e3c6f070638a2cd40f3131ba88d67c5032b"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-x64.tar.gz"
      sha256 "f35521cee9b5682ca7c264313e93d20e8a674ca9bde944cc985cf06224062385"
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
