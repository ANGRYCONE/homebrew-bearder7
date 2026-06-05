class Bearder < Formula
  desc "A custom CLI tool (Bearder)"
  homepage "https://github.com/ANGRYCONE/bearder7"
  url "https://github.com/ANGRYCONE/bearder7/releases/download/v1.0/bearder"
  sha256 "b419b3143546a5614ac8046fb1c86c3958609cd3391c0f00cc02db8a30df9002"
  version "1.0"
  
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
