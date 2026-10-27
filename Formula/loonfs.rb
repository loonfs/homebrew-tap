class Loonfs < Formula
  desc "Durable filesystem built on object storage"
  homepage "https://github.com/loonfs/loonfs"
  url "https://github.com/loonfs/loonfs/releases/download/v0.5.0/loonfs-aarch64-apple-darwin.tar.gz"
  sha256 "80f849ed5adf8f8d1b82f22597e494dc595b52782af6d301a5ad35125eb594f7"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.5.0/loonfs-x86_64-apple-darwin.tar.gz"
      sha256 "cdc9ace1f27a02aa9597ca5bbb30786a7819f886907e7bb8dc56d6df5e8f98f3"
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
