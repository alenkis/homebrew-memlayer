class Memlayer < Formula
  desc "Memory layer for LLM applications"
  homepage "https://github.com/alenkis/memlayer"
  version "0.1.2"
  url "https://github.com/alenkis/memlayer/releases/download/v0.1.2/memlayer-0.1.2.tar.gz"
  sha256 "564ed738ab325724275e6548442c0af13d4bef5bd7d7b85cbfb57458c7c8d9cb"
  license "AGPL-3.0-only"

  depends_on "openjdk"

  def install
    libexec.install "bin/memlayer.jar"
    libexec.install "bin/memlayer"
    chmod 0755, libexec/"memlayer"

    (bin/"memlayer").write_env_script libexec/"memlayer",
      JAVA_HOME: Formula["openjdk"].opt_prefix
  end

  test do
    assert_match "Usage: memlayer", shell_output("#{bin}/memlayer --help 2>&1", 1)
  end
end
