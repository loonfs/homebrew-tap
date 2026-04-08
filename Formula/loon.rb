class Loon < Formula
  desc "CLI for the Loon object-store-backed file service"
  homepage "https://github.com/loonfs/loonfs"
  version "0.1.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/loonfs/loonfs/releases/download/v0.1.0/loon-aarch64-apple-darwin.tar.gz"
      sha256 "7d254f3f87e465d171311507d32650e9b15c00cc4720bec9799afe8fe51e9e9b"
    end

    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.1.0/loon-x86_64-apple-darwin.tar.gz"
      sha256 "c9513d9d7f93be0cf0e06cf5e1f42c7b2e2d2f3713bfc4526c4fb09250f2721e"
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
