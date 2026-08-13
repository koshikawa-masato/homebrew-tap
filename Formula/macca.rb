# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.6/macca-darwin-arm64"
      sha256 "28cd578a5f838a07011d6c53b8f2f8143abfc74194913bc6465df2055b4270b6"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.6/macca-darwin-amd64"
      sha256 "f0247af8bf5689682b34ad996390296e0b9413c67f3bb42778f2bc742525b1b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.6/macca-linux-arm64"
      sha256 "5a53c728b199f64a5a42e7f34c101fb7f0cde0769690dd062daa8a3191fed85d"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.6/macca-linux-amd64"
      sha256 "df3a6cc79d2944c5247a99f44f03dcb916b7e97c7aa1221cc22ee58bb79aab66"
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
