class Actual < Formula
  desc "ADR-powered AI context file generator"
  homepage "https://cli.actual.ai"
  version "0.4.0"
  license "UNLICENSED"

  on_macos do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-arm64.tar.gz"
      sha256 "56c84fd0c8aa43166fb29f302b7183329ef34b1c4d27ea7e3bb92a18f3fc0f71"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-darwin-x64.tar.gz"
      sha256 "911fe3fac60442701bfffd4c147ae928c9b77b40222f90eea40587485b06612a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-arm64.tar.gz"
      sha256 "51ebb1a5f2a4b279daa2ca2594a4c50be3c88dfc35153b6431a5551a728a5fdd"
    end
    on_intel do
      url "https://github.com/actual-software/actual-releases/releases/download/v#{version}/actual-linux-x64.tar.gz"
      sha256 "c1a3985446fa524321e32e0a528483444ada8a9b914008b7b3fdc2093584fea6"
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
