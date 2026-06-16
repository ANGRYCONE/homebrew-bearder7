class Bearder < Formula
  desc "A custom CLI tool (Bearder)"
  homepage "https://github.com/ANGRYCONE/bearder7"
  url "https://github.com/ANGRYCONE/homebrew-bearder7/releases/download/v1.2.4/bearder"
  sha256 "39b3ab7d81844163c50cd25055f2a9b8dc01a57492b6e2eb6da0e958a5b412ae"
  version "1.2.4"

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
