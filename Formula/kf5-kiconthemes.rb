class Kf5Kiconthemes < Formula
  desc "Support for icon themes"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.44/kiconthemes-5.44.0.tar.xz"
  sha256 "dca63fd7e331c6679cec264233835245b0f25baec2996454e90c23031652a419"
  revision 1

  head "git://anongit.kde.org/kiconthemes.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "gettext" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "KDE-mac/kde/kf5-karchive"
  depends_on "KDE-mac/kde/kf5-kconfigwidgets"
  depends_on "KDE-mac/kde/kf5-kitemviews"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DBUILD_QCH=ON"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
