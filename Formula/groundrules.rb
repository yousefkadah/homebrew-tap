class Groundrules < Formula
  desc "One source of truth for AI coding agents (node-free binary)"
  homepage "https://github.com/yousefkadah/groundrules"
  url "https://github.com/yousefkadah/groundrules/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "1c9c93e43362ae033273090489df7cd381a881bebf260a3d6b5b93366a733cef"
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
