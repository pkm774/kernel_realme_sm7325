# set toolchains directory
TOP=$(realpath ../)

# export aosp gcc toolchains path


PATH="$TOP/tools/build-tools/linux-x86/bin:$PATH"
PATH="$TOP/tools/build-tools/path/linux-x86:$PATH"
PATH="$TOP/tools/gas/linux-x86:$PATH"
PATH="$TOP/tools/misc/linux-x86/lz4:$PATH"
PATH="$TOP/tools/misc/linux-x86/dtc:$PATH"
PATH="$TOP/tools/misc/linux-x86/libufdt:$PATH"
PATH="$TOP/tools/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:$PATH"
PATH="$TOP/tools/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:$PATH"
PATH="$TOP/tools/clang/host/linux-x86/clang-r428724/bin:$PATH"
export LD_LIBRARY_PATH="$TOP/tools/clang/host/linux-x86/clang-r428724/lib64:$LD_LIBRARY_PATH"
export DTC_EXT="$TOP/tools/misc/linux-x86/dtc/dtc"
export DTC_OVERLAY_TEST_EXT="$TOP/tools/misc/linux-x86/libufdt/ufdt_apply_overlay"
MAKE_PATH=${TOP}/tools/build-tools/linux-x86/bin/

KERNEL_ARCH=arm64
ARCH=${KERNEL_ARCH}
DEFCONFIG=lahaina_defconfig

CLANG_TRIPLE=aarch64-linux-gnu-
CROSS_COMPILE=aarch64-linux-android-
CROSS_COMPILE_COMPAT=arm-linux-androideabi-

TARGET_KERNEL_MAKE_ENV+="HOSTCC=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/clang "
TARGET_KERNEL_MAKE_ENV+="HOSTCXX=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/clang++ "
TARGET_KERNEL_MAKE_ENV+="HOSTLD=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/ld.lld "
TARGET_KERNEL_MAKE_ENV+="CC=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/clang "
TARGET_KERNEL_MAKE_ENV+="LLVM=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/clang "
TARGET_KERNEL_MAKE_ENV+="LD=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/ld.lld "
TARGET_KERNEL_MAKE_ENV+="AR=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/llvm-ar "
TARGET_KERNEL_MAKE_ENV+="NM=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/llvm-nm "
TARGET_KERNEL_MAKE_ENV+="OBJCOPY=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/llvm-objcopy "
TARGET_KERNEL_MAKE_ENV+="OBJDUMP=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/llvm-objdump "
TARGET_KERNEL_MAKE_ENV+="OBJSIZE=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/llvm-size "
TARGET_KERNEL_MAKE_ENV+="READELF=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/llvm-readelf "
TARGET_KERNEL_MAKE_ENV+="STRIP=${TOP}/tools/clang/host/linux-x86/clang-r428724/bin/llvm-strip "

${MAKE_PATH}make O=out ${TARGET_KERNEL_MAKE_ENV} ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} CROSS_COMPILE_COMPAT=${CROSS_COMPILE_COMPAT} CLANG_TRIPLE=${CLANG_TRIPLE} ${DEFCONFIG}

${MAKE_PATH}make O=out ${TARGET_KERNEL_MAKE_ENV} ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} CROSS_COMPILE_COMPAT=${CROSS_COMPILE_COMPAT} CLANG_TRIPLE=${CLANG_TRIPLE} -j$(nproc)
