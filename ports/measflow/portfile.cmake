vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vreitenbach/MeasFlow
    REF "v${VERSION}"
    SHA512 743a2cdd4711528b8c2d17fe70604659ef3132739cf4bc98ce53f2a3f958502186209f5bbe6627e2c6fe2c932459e043a53864ee54f4fde61ba4bd943aec08dd
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
