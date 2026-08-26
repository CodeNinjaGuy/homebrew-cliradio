class Cliradio < Formula
  desc "Terminal-Player für Radiostreams und YouTube-Musik mit farbigem FFT-Equalizer"
  homepage "https://github.com/CodeNinjaGuy/CLIRadio"
  url "https://github.com/CodeNinjaGuy/CLIRadio/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "96b80b1693eb65380f767cbb08e3f7558f6b5cd2df20a082ef6064137cc8b8b4"
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
