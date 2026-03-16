vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vreitenbach/MeasFlow
    REF "v${VERSION}"
    SHA512 6bd30db76010e7fd7ddfe1771878129f7d204c3fe9fedf620a24cedcf2bcffe948a07d098ce41c964f3730de9f5447aa4b99d3c68077cf5fdc164ea6893c1835
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
