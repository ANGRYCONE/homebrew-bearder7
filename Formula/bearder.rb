class Bearder < Formula
  desc "A custom CLI tool (Bearder)"
  homepage "https://github.com/ANGRYCONE/bearder7"
  url "https://github.com/ANGRYCONE/homebrew-bearder7/releases/download/v1.2.3/bearder"
  sha256 "f15e351ee3fbb820cb35df596998e3c96323b46edced633a617214389ede5468"
  version "1.2.3"
  
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
