class Bearder < Formula
  desc "A custom CLI tool (Bearder)"
  homepage "https://github.com/ANGRYCONE/bearder7"
  url "https://github.com/ANGRYCONE/homebrew-bearder7/releases/download/v1.1/bearder"
  sha256 "09261c510940e766462e9196d3c76601a961d12518ac1008b0534693fc5fd304"
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
