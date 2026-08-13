# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.5/macca-darwin-arm64"
      sha256 "4ea93a0fb5ac57cebf7c9859555ae61bff1023cedfe2eb2c3f0b67706da61e13"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.5/macca-darwin-amd64"
      sha256 "6e654b0df292c9307429be0e9f9b2fa4e0bdf20d9ebc2ca3fdae896bbcfc578e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.5/macca-linux-arm64"
      sha256 "f777c147153642d87f616a90a21cac11bd8c4abc30911e7fd745a7123c810464"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.5/macca-linux-amd64"
      sha256 "d4e451c8849fe8069350262f3b80534f49ef18b11e144c4fce99b87639a5af5d"
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
