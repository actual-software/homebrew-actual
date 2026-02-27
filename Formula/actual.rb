class Actual < Formula
  desc "ADR-powered AI context file generator"
  homepage "https://cli.actual.ai"
  version "0.1.0"
  license "UNLICENSED"

  on_macos do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-arm64.tar.gz"
      sha256 "22a464e28a62b2042260fddd14420000d1378bea0cde72fa0040e49d865aa3f9"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-x64.tar.gz"
      sha256 "0c3798c2cc29b3358ed114eaa1d88363ad30fa1a6b192d72ba9bf20a879160ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-arm64.tar.gz"
      sha256 "71842eca2a1a6457f7c0cb37609053f515e4d8a645292115e9d8b2f5548fcd42"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-x64.tar.gz"
      sha256 "043ec819c225cd0db4592c8cde2f91892361821f21ca227dda82290e9310d525"
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
