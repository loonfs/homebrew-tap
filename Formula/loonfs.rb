class Loonfs < Formula
  desc "Durable filesystem built on object storage"
  homepage "https://github.com/loonfs/loonfs"
  url "https://github.com/loonfs/loonfs/releases/download/v0.3.1/loonfs-aarch64-apple-darwin.tar.gz"
  sha256 "10b797b55a7dd22760997f5d95652f1f51bd168b6bc1ac51cdb775e024e6a469"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.3.1/loonfs-x86_64-apple-darwin.tar.gz"
      sha256 "add30f16717f5aa359c80b7a604427a44f1f51c3a1e69704a1c137231584ef3b"
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
