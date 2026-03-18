vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vreitenbach/MeasFlow
    REF "v${VERSION}"
    SHA512 c2a99793a75f4d75e1e94e4ca59eb94b45974352c3a56587f432bb828159d00d4c4e2602a1dc458920a292b25b106770c623fc679910bde33852166fe7c5b1a3
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/c"
    OPTIONS
        -DMEAS_BUILD_TESTS=OFF
        -DMEAS_BUILD_QUICKSTART=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME measflow CONFIG_PATH lib/cmake/measflow)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
