# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.2.0/macca-darwin-arm64"
      sha256 "78d2f954a681da84a80f9efbad82edeb86ac96e40c74c71a1162d791a0efcfc2"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.2.0/macca-darwin-amd64"
      sha256 "4b7608d0b75058523e1c9d1f786c198b7c5e38f63395ae20443e3a83fb1f4b6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.2.0/macca-linux-arm64"
      sha256 "753c6f8c7c652bb73f249d9e603600123793387d8f9d126a7228397af5e365ac"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.2.0/macca-linux-amd64"
      sha256 "c091a2d30b410d96c3aab38e6eaff7a989658de26a31ef4e3f8992ac22f8a677"
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
