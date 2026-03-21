vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vreitenbach/MeasFlow
    REF "v${VERSION}"
    SHA512 ac5225d8df4fbc55e4b499208963b18d3e6aafefaf969f0b3b07659821e70c78ed211613493e4ef3b5b86280d409bc0932dbcddc9b3a9ce431a1ad852669e5a1
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
