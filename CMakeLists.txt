cmake_minimum_required(VERSION 3.20)

project(asteroid-virtualkeyboard
	VERSION 0.0.1
	DESCRIPTION "Virtual keyboard for AsteroidOS")

find_package(ECM REQUIRED NO_MODULE)
find_package(AsteroidApp REQUIRED)

set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ASTEROID_MODULE_PATH})

include(FeatureSummary)
include(GNUInstallDirs)
include(ECMFindQmlModule)

add_subdirectory(styles)

feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)

set(CPACK_GENERATOR "DEB")
string(TOLOWER "${CMAKE_PROJECT_NAME}" lcproject_name)
set(CPACK_DEBIAN_FILE_NAME "${lcproject_name}-${CMAKE_PROJECT_VERSION}.ipk")
set(CPACK_STRIP_FILES TRUE)
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE armv7vehf-neon)
if (NOT CPACK_PACKAGE_CONTACT) 
    set(CPACK_PACKAGE_CONTACT bogus@example.org)
    message(WARNING "No package contact specified: using ${CPACK_PACKAGE_CONTACT}")
endif()
include(CPack)
