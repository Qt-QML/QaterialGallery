message(STATUS "Pre Build Platform Dependancies Configuration")
message(STATUS "CMAKE_SYSTEM_NAME :         ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_HOST_SYSTEM_NAME :    ${CMAKE_HOST_SYSTEM_NAME}")

MACRO(download_qbc)

    IF(QBC_FOUND AND NOT QQMHG_DOWNLOAD_QBC)
        MESSAGE( STATUS "Found QBC" )
    ELSE(QBC_FOUND AND NOT QQMHG_DOWNLOAD_QBC)
        SET(QQMHG_DOWNLOAD_QBC ON CACHE BOOL "The Qbc library have been downloaded")
        INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/cmake/BuildQBCInstaller.cmake)
        IF(NOT QBC_FOUND)
            MESSAGE( FATAL_ERROR "Fail to configure Qbc Library" )
        ENDIF(NOT QBC_FOUND)
    ENDIF(QBC_FOUND AND NOT QQMHG_DOWNLOAD_QBC)

ENDMACRO(download_qbc)

# ───────── WINDOWS ──────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

    set(QATERIALGALLERY_PLATFORM_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.rc")
    set(QATERIALGALLERY_PLATFORM_TARGET WIN32)

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

# ────────── LINUX ───────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

    download_qbc()

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

# ────────── MACOS ───────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")

    download_qbc()

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")

# ───────── ANDROID ──────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

    set(QATERIALGALLERY_BUILD_SHARED ON CACHE BOOL "Build as a shared library" FORCE)
    set(QATERIALGALLERY_BUILD_STATIC OFF CACHE BOOL "Build as a static library" FORCE)
    set(QATERIALGALLERY_BUILD_EXE OFF CACHE BOOL "Build as an executable" FORCE)

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

# ─────────── IOS ────────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")