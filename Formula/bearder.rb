class Bearder < Formula
  desc "A custom CLI tool (Bearder)"
  homepage "https://github.com/ANGRYCONE/bearder7"
  url "https://github.com/ANGRYCONE/homebrew-bearder7/releases/download/v1.1/bearder"
  sha256 "f86e12984fa4a1c08af5069e26ff3e456186b60af512c25f8321806e10225b80"
  version "1.1"
  
  depends_on :macos

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  def install
    bin.install "bearder"
  end

  test do
    system "#{bin}/bearder", "--version"
  end
end
