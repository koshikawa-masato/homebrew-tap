# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.8/macca-darwin-arm64"
      sha256 "676497d766c2a110ebdbab85d5e3adec761b18a3112e96884e200b87f79a2035"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.8/macca-darwin-amd64"
      sha256 "0ebcb4b3ac85857770d0a086d755dac917665992513d4a47840a9e1f033907fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.8/macca-linux-arm64"
      sha256 "740d1a88a1558aeeeb507f7281c92f46c6c6571c14ee2dd516e2009aff32549f"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.8/macca-linux-amd64"
      sha256 "9c247664f9bde8f4fcd6f86c59a1969bcca0fa43e41e75c4e5923f21a4bea05c"
    end
  end

  def install
    bin.install Dir["macca-*"].first => "macca"
  end

  def caveats
    <<~EOS
      起動: macca --open
      iTunes / ミュージックのライブラリを自動検出してブラウザが開きます。
    EOS
  end

  test do
    assert_match "macca", shell_output("#{bin}/macca --help")
  end
end
