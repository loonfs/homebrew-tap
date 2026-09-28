class Loonfs < Formula
  desc "Durable filesystem built on object storage"
  homepage "https://github.com/loonfs/loonfs"
  url "https://github.com/loonfs/loonfs/releases/download/v0.4.0/loonfs-aarch64-apple-darwin.tar.gz"
  sha256 "ac419f52676bfeee4820ded9496e62c4302896a553c34d54420662ce396ebd40"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/loonfs/loonfs/releases/download/v0.4.0/loonfs-x86_64-apple-darwin.tar.gz"
      sha256 "8a781ab8120b15e630f47e8b94768308ee0013be1e502891206caf5b3005a255"
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
