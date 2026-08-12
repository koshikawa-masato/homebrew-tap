# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.3/macca-darwin-arm64"
      sha256 "ac34689677d4e31dd6dc499d7ff38dd2d28e05283794dfacecaa0d9fc19f47d2"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.3/macca-darwin-amd64"
      sha256 "042fd0902e578aa1f019d0d01ec4541497f8c39dc4ac58c648d22911e69f9eae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.3/macca-linux-arm64"
      sha256 "08214237d88f0dd046b05d5b5b91ea88be737383bd8cb39770841c91cd3a0347"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.3/macca-linux-amd64"
      sha256 "dfa84e236909372168ecb69fba2e4d3de56735389de5b9e36886e5cb77f3c5d0"
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
