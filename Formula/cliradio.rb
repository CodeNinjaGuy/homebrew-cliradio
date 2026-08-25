class Cliradio < Formula
  desc "Terminal-Player für Radiostreams und YouTube-Musik mit farbigem FFT-Equalizer"
  homepage "https://github.com/CodeNinjaGuy/CLIRadio"
  url "https://github.com/CodeNinjaGuy/CLIRadio/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "e6b795ca0b73da3953ce72ff61ee72d17c2da6665505cd1605cb2d9a6c25c625"
  license "MIT"
  head "https://github.com/CodeNinjaGuy/CLIRadio.git", branch: "main"

  depends_on "go" => :build
  depends_on "ffmpeg"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  def caveats
    <<~EOS
      YouTube-Wiedergabe benötigt zusätzlich yt-dlp:
        brew install yt-dlp
    EOS
  end

  test do
    assert_match "CLIRadio", shell_output("#{bin}/cliradio -version")
  end
end
