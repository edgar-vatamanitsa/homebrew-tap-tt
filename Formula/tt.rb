class Tt < Formula
  desc "Plain-text task tracker that lives in the tasks/ folder of your repo"
  homepage "https://github.com/edgar-vatamanitsa/tt"
  version "0.2.0"
  license "GPL-2.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/edgar-vatamanitsa/tt/releases/download/v0.2.0/tt-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "88f57ceab8e10447ec95a1d16e84dfc44b24dfcd9a2bcc08d8401d431e782425"
    end
    on_intel do
      url "https://github.com/edgar-vatamanitsa/tt/releases/download/v0.2.0/tt-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "7d8d076a3a40297b9943ecc468a260ecb98858e8869eac12210e885bb3f40c98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/edgar-vatamanitsa/tt/releases/download/v0.2.0/tt-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a10fb0fbba6c542fe6e559c9fbaebdbef60abe012fac29ecb6135a87eaed7eff"
    end
  end

  def install
    bin.install "tt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tt version")
    system bin/"tt", "init"
    system bin/"tt", "new", "-t", "test", "Brew test task"
    assert_match "Brew test task", shell_output("#{bin}/tt ls :test")
  end
end
