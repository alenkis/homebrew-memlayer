class Memlayer < Formula
  desc "Memory layer for LLM applications"
  homepage "https://github.com/alenkis/memlayer"
  version "0.1.0"
  url "https://github.com/alenkis/memlayer/releases/download/v0.1.0/memlayer-0.1.0.tar.gz"
  sha256 "445fc4e77c6f179ac92e6b53c461818d6c1cec721e6a8c8aaafc19746c88972b"
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
