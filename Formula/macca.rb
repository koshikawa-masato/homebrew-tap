# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.2/macca-darwin-arm64"
      sha256 "eafe610bed4bb47577532675477ad17e7f9995100c131e2e0c199b4bffd6dc1a"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.2/macca-darwin-amd64"
      sha256 "d3a3f92b5073eb3c2a289fe352a78b6e5af86ba25ec1d2c1c93b80d2ded4a568"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.2/macca-linux-arm64"
      sha256 "d95edc61843ad2d0feb6e26827accd8171c2aa1806839697c3a4d340a87b5291"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.2/macca-linux-amd64"
      sha256 "051dec833dac970852320245ba71711328497b74c9f67ffc1e879c2f55031943"
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
