class Memlayer < Formula
  desc "Memory layer for LLM applications"
  homepage "https://github.com/alenkis/memlayer"
  version "0.1.1"
  url "https://github.com/alenkis/memlayer/releases/download/v0.1.1/memlayer-0.1.1.tar.gz"
  sha256 "c8429b9e02452699ad8fce298cc534db0f21b2230a3775a5f32c09f3ad3d98d8"
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
