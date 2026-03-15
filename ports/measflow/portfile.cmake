vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vreitenbach/MeasFlow
    REF "v${VERSION}"
    SHA512 68966a14898a91d9114d7d6271f811dde4437385fd7e606ea893e15af0a62337c1e233da667328b2c8ddd255130ed4663513fb9f38d141509fe2b28dcb16dba6
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
