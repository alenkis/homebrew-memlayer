class Memlayer < Formula
  desc "Memory layer for LLM applications"
  homepage "https://github.com/alenkis/memlayer"
  version "0.0.1"
  url "https://github.com/alenkis/memlayer/releases/download/v0.0.1/memlayer-0.0.1.tar.gz"
  sha256 "9cf95b4481dd138fba60015e7cbb7692de70ce431c8328691d62c5ca96a2046a"
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
