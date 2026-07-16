class Groundrules < Formula
  desc "One source of truth for AI coding agents (node-free binary)"
  homepage "https://github.com/yousefkadah/groundrules"
  url "https://github.com/yousefkadah/groundrules/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "41579c41a9f369ce9c734b789f8613670ad200adaeff553e2b951db2c86ed79a"
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
