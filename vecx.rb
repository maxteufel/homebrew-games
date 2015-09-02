class Vecx < Formula
  desc "Vectrex emulator"
  homepage "https://github.com/jhawthorn/vecx"
  url "https://github.com/jhawthorn/vecx/archive/v1.0.tar.gz"
  sha256 "6aac0c1840982aa3cc8607d5fa65597b6644840f2ba1ea3715a0349522312f56"

  head do
    url "https://github.com/jhawthorn/vecx.git"
    depends_on "sdl_image"
  end

  depends_on "sdl"
  depends_on "sdl_gfx"

  def install
    # Fix missing symobls for inline functions
    # https://github.com/jhawthorn/vecx/pull/3
    inreplace ["e6809.c", "vecx.c"], /__inline/, 'static \1'

    system "make"
    bin.install "vecx"
  end
end
