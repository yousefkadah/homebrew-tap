class Groundrules < Formula
  desc "One source of truth for AI coding agents (node-free binary)"
  homepage "https://github.com/yousefkadah/groundrules"
  url "https://github.com/yousefkadah/groundrules/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "16d8840dbfaafff3c0dd17d87639e60a63f11733481a0550e714e3911222be89"
  license "MIT"
  head "https://github.com/yousefkadah/groundrules.git", branch: "main"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "one source of truth", shell_output("#{bin}/groundrules --help")
    system bin/"groundrules", "detect", "--cwd=#{testpath}"
  end
end
