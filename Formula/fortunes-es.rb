class FortunesEs < Formula
  desc "Spanish fortune cookie database"
  homepage "https://tracker.debian.org/pkg/fortunes-es"
  url "https://deb.debian.org/debian/pool/main/f/fortunes-es/fortunes-es_1.36+nmu1.tar.xz"
  version "1.36+nmu1"
  sha256 "066af67f6295666ccf7deeca0159416dcf3f8dbf825553cab13e461e3458345a"
  # The cookies are presumed public domain (debian/copyright: PD-FORTUNES-ES);
  # the helper scripts, not installed, are GPL-2.0-or-later.
  license :public_domain

  livecheck do
    url "https://deb.debian.org/debian/pool/main/f/fortunes-es/"
    regex(/href=.*?fortunes-es[._-]v?(\d+(?:\.\d+)+(?:\+nmu\d+)?)\.t/i)
  end

  depends_on "fortune"

  def install
    # Same file list and conversion as Debian's install-utf8 target:
    # latin1 sources, UTF-8 output, strfile index next to each file.
    cookies = File.read("datfiles/Makefile")[/^COOKIES=(.*?)\n\n/m, 1].split - ["\\"]
    dir = share/"games/fortunes/es"
    dir.mkpath
    cookies.each do |name|
      out = dir/File.basename(name, ".fortunes")
      out.write File.binread("datfiles/#{name}").force_encoding(Encoding::ISO_8859_1).encode(Encoding::UTF_8)
      system formula_opt_bin("fortune")/"strfile", "-s", out
    end
  end

  def caveats
    <<~EOS
      Homebrew's fortune only searches its own Cellar directory, so pass the path:
        fortune #{opt_share}/games/fortunes/es
        fortune #{opt_share}/games/fortunes/es/refranes
    EOS
  end

  test do
    assert_match(/\S/, shell_output("#{formula_opt_bin("fortune")}/fortune #{share}/games/fortunes/es"))
  end
end
