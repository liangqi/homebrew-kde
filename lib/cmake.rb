# frozen_string_literal: true

require "formula"

def kde_cmake_args
  std_cmake_args + %W[
    -G Ninja
    -B build
    -S .
    -D BUILD_QCH=ON
    -D BUILD_TESTING=ON
    -D BUILD_TESTS=ON
    -D BUILD_UNITTESTS=ON
    -D CMAKE_INSTALL_BUNDLEDIR=#{bin}
    -D CMAKE_COMPILE_WARNING_AS_ERROR=FALSE
    -D KDE_INSTALL_LIBDIR=lib
    -D KDE_INSTALL_PLUGINDIR=lib/qt6/plugins
    -D KDE_INSTALL_QMLDIR=lib/qt6/qml
    -D KDE_INSTALL_QTPLUGINDIR=lib/qt6/plugins
    -D APPLE_SUPPRESS_X11_WARNING=ON
    -D KF_IGNORE_PLATFORM_CHECK=ON
  ]
end
