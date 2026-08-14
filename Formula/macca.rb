# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.9/macca-darwin-arm64"
      sha256 "4a9956136d9609e8436a69d9ddb557c7794aeffbefd14a2becb2c87a865779db"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.9/macca-darwin-amd64"
      sha256 "b2cf0b2d1b03ae440cb6255785de130421988dfac51b47e4ac0b243e07a550dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.9/macca-linux-arm64"
      sha256 "a6c0a37b103a069c95b1a47b71ddbe5a03f798b40dec1268316c8e5da341b4c4"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.9/macca-linux-amd64"
      sha256 "8978ba61ba864177f0793d18ed236b23431dbdab5dbaf72e7bff86d9a89b7d61"
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
