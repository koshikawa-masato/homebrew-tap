# macca — iTunes 不要のローカル音楽ライブラリ管理・再生 Web アプリ
# インストール: brew install koshikawa-masato/tap/macca
class Macca < Formula
  desc "Local music library manager & player in your browser (no iTunes needed)"
  homepage "https://github.com/koshikawa-masato/macca"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.7/macca-darwin-arm64"
      sha256 "461559891ac09820b5d633fd7ffd2e2752a1a231eb8582a9c108a30bda695577"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.7/macca-darwin-amd64"
      sha256 "a43a35f132bcab215b413ff8646e083efe5f60f316b1cc93d5f16e42a16832ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.7/macca-linux-arm64"
      sha256 "8efcf500d33c3c280349bff7b5fd469a8550be248e2d6005178d54abb4d0433b"
    else
      url "https://github.com/koshikawa-masato/macca/releases/download/v0.1.7/macca-linux-amd64"
      sha256 "0f7781162a7c53ac8dfddb54cf871b8b3d0fe36d70c3e9f0c3053d7e0986d06f"
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
