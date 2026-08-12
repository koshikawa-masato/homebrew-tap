# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.0/macca-darwin-arm64"
      sha256 "73334197117b1fb367403bfd5142400f457853bce2046f06acb8e2ebe02516c1"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.0/macca-darwin-amd64"
      sha256 "08f2eb0e75165e909ca9265e5c65e95151dbf5a0e7ecc4623953d493efecc621"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.0/macca-linux-arm64"
      sha256 "75ccbda44b4b5a75c8dcd8ef032dffbf24f5d6cd9a4b97c307399511a78986e8"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.0/macca-linux-amd64"
      sha256 "e6a19396b6452e769afcd771bde96498639e696049df829c9a0dec41599bc6ba"
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
