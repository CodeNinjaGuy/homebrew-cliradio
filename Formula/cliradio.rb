class Cliradio < Formula
  desc "Terminal-Player für Radiostreams und YouTube-Musik mit farbigem FFT-Equalizer"
  homepage "https://github.com/CodeNinjaGuy/CLIRadio"
  url "https://github.com/CodeNinjaGuy/CLIRadio/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "97b04e50d9d67424dd31a9052c80043756b6f38e38fa048bf83baef87d9e358e"
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
