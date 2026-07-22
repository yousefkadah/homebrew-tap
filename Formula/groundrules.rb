class Groundrules < Formula
  desc "One source of truth for AI coding agents (node-free binary)"
  homepage "https://github.com/yousefkadah/groundrules"
  url "https://github.com/yousefkadah/groundrules/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "646f6f81ec614328915192789c8d003b534e2787d12fe04616bb1aa192b56dfa"
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
