class Memlayer < Formula
  desc "Memory layer for LLM applications"
  homepage "https://github.com/alenkis/memlayer"
  version "0.0.1"
  url "https://github.com/alenkis/memlayer/releases/download/v0.0.1/memlayer-0.0.1.tar.gz"
  sha256 "4f26ced85852719a7eb0cf266b6e2b454c5f4a65b60990765e01fa9a1a2f5133"
  license "AGPL-3.0-only"

  depends_on "openjdk@22"

  def install
    libexec.install "bin/memlayer.jar"
    libexec.install "bin/memlayer"
    chmod 0755, libexec/"memlayer"

    (bin/"memlayer").write_env_script libexec/"memlayer",
      JAVA_HOME: Formula["openjdk@22"].opt_prefix
  end

  test do
    assert_match "Usage: memlayer", shell_output("#{bin}/memlayer --help 2>&1", 1)
  end
end
