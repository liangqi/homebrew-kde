class Kf5Kdesu < Formula
  url "https://download.kde.org/stable/frameworks/5.40/kdesu-5.40.0.tar.xz"
  sha256 "87a94cdb687d0460737e0adb8105cf2323a09ac539ab63d917ca70961829bb8d"
  desc "Integration with su for elevated privileges"
  homepage "https://www.kde.org"

  head "git://anongit.kde.org/kdesu.git"

  depends_on "cmake" => :build
  depends_on "gettext" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "qt"
  depends_on "KDE-mac/kde/kf5-kpty"
  depends_on "KDE-mac/kde/kf5-kservice"

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
