class Loonfs < Formula
  desc "Durable filesystem built on object storage"
  homepage "https://github.com/loonfs/loonfs"
  url "https://github.com/loonfs/loonfs/releases/download/v0.2.0/loonfs-aarch64-apple-darwin.tar.gz"
  sha256 "cd04e642b56123b8f9349de1b71290aa705f19957704a3e882b7cbc460826ba0"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.2.0/loonfs-x86_64-apple-darwin.tar.gz"
      sha256 "f384679f8626098e6d93b403c4f2af0fd01e963f91d3fa2949e5023729da136f"
      version "0.2.0"
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
