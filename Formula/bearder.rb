class Bearder < Formula
  desc "A custom CLI tool (Bearder)"
  homepage "https://github.com/ANGRYCONE/bearder7"
  url "https://github.com/ANGRYCONE/homebrew-bearder7/releases/download/v1.4.0/bearder"
  sha256 "f2e920d78242c951cf7a4dc3376daf0f6f62ac4283b4b873ca6d67fdb7e15d41"
  version "1.4.0"

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
