class Cliradio < Formula
  desc "Terminal-Player für Radiostreams und YouTube-Musik mit farbigem FFT-Equalizer"
  homepage "https://github.com/CodeNinjaGuy/CLIRadio"
  url "https://github.com/CodeNinjaGuy/CLIRadio/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f3314a41f0e94fb989ce72c5be271c4bdc0c6798b65021e1e6bd27586ffdb7bf"
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
