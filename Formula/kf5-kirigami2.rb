require_relative "../lib/cmake"

class Kf5Kirigami2 < Formula
  desc "QtQuick based components set"
  homepage "https://api.kde.org/frameworks/kirigami/html/index.html"
  url "https://download.kde.org/stable/frameworks/5.95/kirigami2-5.95.0.tar.xz"
  sha256 "ef9cbf1a59d058e874757059934dfba2fd106811f344367bd316cce449a80e1d"
  head "https://invent.kde.org/frameworks/kirigami.git", branch: "master"

  depends_on "cmake" => [:build, :test]
  depends_on "doxygen" => :build
  depends_on "extra-cmake-modules" => [:build, :test]
  depends_on "graphviz" => :build
  depends_on "kde-mac/kde/kf5-kpackage" => :build
  depends_on "ninja" => :build

  depends_on "qt@5"

  def install
    args = kde_cmake_args

    system "cmake", *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
    prefix.install "build/install_manifest.txt"
  end

  def caveats
    <<~EOS
      You need to take some manual steps in order to make this formula work:
        "$(brew --repo kde-mac/kde)/tools/do-caveats.sh"
    EOS
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(KF5Kirigami2 REQUIRED)")
    system "cmake", ".", "-Wno-dev"
  end
end
