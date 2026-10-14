class Actual < Formula
  desc "ADR-powered AI context file generator"
  homepage "https://cli.actual.ai"
  version "0.7.0"
  license "UNLICENSED"

  on_macos do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-arm64.tar.gz"
      sha256 "2da61673854ce7e5b5b35ae3b629c964b930248ac60635ab4a1e0e4f72a24614"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-x64.tar.gz"
      sha256 "e1fb8f0355cf82926fd221e8bed1af357f8ddf674d69699441290feb983e5456"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-arm64.tar.gz"
      sha256 "53e7fb4ecadfc2f63b178a7cbf6931c3780610be712545fd9ee681639134513c"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-x64.tar.gz"
      sha256 "4ed5c264f5c2a482addc261f25a9dca2067540155d664ca1545ef9ac0b1a8dc5"
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
