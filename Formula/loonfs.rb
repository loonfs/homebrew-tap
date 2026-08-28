class Loonfs < Formula
  desc "Durable filesystem built on object storage"
  homepage "https://github.com/loonfs/loonfs"
  url "https://github.com/loonfs/loonfs/releases/download/v0.3.0/loonfs-aarch64-apple-darwin.tar.gz"
  sha256 "af4e2504ed49a0dafe8c569bbd524d82060203cf6353516985e81509fbed92e1"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.3.0/loonfs-x86_64-apple-darwin.tar.gz"
      sha256 "26482cd5e2fc1c4b81d0442c0397e707f34e0490e6d4e1154e2ed249c9f9c151"
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
