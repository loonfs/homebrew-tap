class Loonfs < Formula
  desc "Durable filesystem built on object storage"
  homepage "https://github.com/loonfs/loonfs"
  url "https://github.com/loonfs/loonfs/releases/download/v0.6.0/loonfs-aarch64-apple-darwin.tar.gz"
  sha256 "9aeb8b03f7dc0c1b23e5d2e4d2d9713b4007481ade0dc31003ace9a2052d8bed"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.6.0/loonfs-x86_64-apple-darwin.tar.gz"
      sha256 "d29cc29407f48b98df913cc3958c550c854e7990471d4881d9554abdce7987dc"
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
