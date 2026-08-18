class Loonfs < Formula
  desc "Durable filesystem built on object storage"
  homepage "https://github.com/loonfs/loonfs"
  url "https://github.com/loonfs/loonfs/releases/download/v0.2.1/loonfs-aarch64-apple-darwin.tar.gz"
  sha256 "b00f015fbc1fa65079f4b16ff167af59b1251e0d5695a0f3db8b85acce8e0746"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.2.1/loonfs-x86_64-apple-darwin.tar.gz"
      sha256 "2af5fcc53bdb4234f7eda1d79ee4d01e44e60462d25cbc64fbfa21b2d012c481"
      version "0.2.1"
    end
  end

  def install
    bin.install "loonfs"
    generate_completions_from_executable(bin/"loonfs", "completion", shell_parameter_format: "--shell=")
    pkgshare.install "README.md", "LICENSE", "VERSION"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/loonfs version")
  end
end
