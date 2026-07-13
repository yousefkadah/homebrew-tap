class Groundrules < Formula
  desc "One source of truth for AI coding agents (node-free binary)"
  homepage "https://github.com/yousefkadah/groundrules"
  url "https://github.com/yousefkadah/groundrules/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "21bdd55017b5afa2fab0d0bc6588f06918e475470d312e615ca097edb982994d"
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
