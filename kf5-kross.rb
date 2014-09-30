require "formula"

class Kf5Kross < Formula
  url "http://download.kde.org/stable/frameworks/5.2.0/portingAids/kross-5.2.0.tar.xz"
  sha1 "69adc9f3c1a8c9ff71228e79272a399f2ce531d7"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kross.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "haraldf/kf5/kf5-kdoctools" => :build
  depends_on "haraldf/kf5/kf5-kparts"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
