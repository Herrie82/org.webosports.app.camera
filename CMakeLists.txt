project(org.webosports.app.camera)

cmake_minimum_required(VERSION 2.8.8)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

include(webOS/webOS)
webos_modules_init(1 0 0 QUALIFIER RC3)
webos_component(0 5 0)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden -fvisibility-inlines-hidden -Wall -std=c++0x")

find_package(Qt5Quick REQUIRED)
if(NOT Qt5Quick_FOUND)
    message(FATAL_ERROR "Qt5Quick module is required!")
endif()

find_package(Qt5Multimedia REQUIRED)
if(NOT Qt5Multimedia_FOUND)
    message(FATAL_ERROR "Qt5Multimedia module is required!")
endif()

set(APP_DIR ${WEBOS_INSTALL_WEBOS_APPLICATIONSDIR}/org.webosports.app.camera)
set(APP_DATA appinfo.json icon.png icon-192x192.png)

install(FILES ${APP_DATA} DESTINATION ${APP_DIR})
install(DIRECTORY qml DESTINATION ${APP_DIR})