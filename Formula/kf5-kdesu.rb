class Kf5Kdesu < Formula
  desc "Integration with su for elevated privileges"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.76/kdesu-5.76.0.tar.xz"
  sha256 "421ef43bd47c3eb6b05806af033276c19df20fd76a06b67fada529bb9c52e642"
  head "https://invent.kde.org/frameworks/kdesu.git"

  depends_on "cmake" => [:build, :test]
  depends_on "doxygen" => :build
  depends_on "gettext" => :build
  depends_on "graphviz" => :build
  depends_on "kde-extra-cmake-modules" => [:build, :test]
  depends_on "ninja" => :build

  depends_on "KDE-mac/kde/kf5-kpty"
  depends_on "KDE-mac/kde/kf5-kservice"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DBUILD_QCH=ON"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"
    args << "-DKDE_INSTALL_QTPLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "-G", "Ninja", "..", *args
      system "ninja"
      system "ninja", "install"
      prefix.install "install_manifest.txt"
    end
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(KF5Su REQUIRED)")
    system "cmake", ".", "-Wno-dev"
  end
end
