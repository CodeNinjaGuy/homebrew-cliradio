class Cliradio < Formula
  desc "Terminal-Player für Radiostreams und YouTube-Musik mit farbigem FFT-Equalizer"
  homepage "https://github.com/CodeNinjaGuy/CLIRadio"
  url "https://github.com/CodeNinjaGuy/CLIRadio/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "3cd93c59398650390f6f812f10a110bef178040eb8c1e6c8b76713daebb96d90"
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
