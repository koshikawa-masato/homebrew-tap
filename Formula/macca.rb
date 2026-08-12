# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.4/macca-darwin-arm64"
      sha256 "a43a59ffc991a8e77a42eec2aca702f51b9a6c538f9fd126b39aa8e984777597"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.4/macca-darwin-amd64"
      sha256 "b14cd3443b7ef0680d966461d0d525011fee7ec39ccfe3ae11b467fdaf278088"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.4/macca-linux-arm64"
      sha256 "273700716616b25bd22efa5654255c54d32cbc272e0052f3b08238b70239986b"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.4/macca-linux-amd64"
      sha256 "4a2704376f3ce011aaa1863845ec1b32dcb8b76b17706d3ffac23b10d9acec8a"
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
