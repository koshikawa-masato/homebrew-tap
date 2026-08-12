# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.1/macca-darwin-arm64"
      sha256 "5437890832b5ee03ed01af10c3e26122a9dcf37de4c5d4001738773992a3c8e2"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.1/macca-darwin-amd64"
      sha256 "ab50e8f0799f10f8f1315abff8da00d94c9ea733913c99ea182d0f9d846cbb1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.1/macca-linux-arm64"
      sha256 "98e2e84356d011bcad50c0102cf8af8bb21d9646c1379fd26b040ff16ab16985"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.1/macca-linux-amd64"
      sha256 "0cc43f2defc40db31cd49cac426548b238fce6d9173be9a01e3f94253b4def28"
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
