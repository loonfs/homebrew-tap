class Loon < Formula
  desc "CLI for the Loon object-store-backed file service"
  homepage "https://github.com/loonfs/loonfs"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/loonfs/loonfs/releases/download/v0.1.1/loon-aarch64-apple-darwin.tar.gz"
      sha256 "6a5ec9a63488e22edc5cb573d61ca438f2b9a691fb21a1fe357d6dbfd935093e"
    end

    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.1.1/loon-x86_64-apple-darwin.tar.gz"
      sha256 "415a7ecaf53f3293c5fa67a6a9450e47103025787500f944054e900d2435b3fd"
    end
  end

  def install
    bin.install "loon"
    pkgshare.install "README.md", "VERSION"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/loon version").strip
  end
end
