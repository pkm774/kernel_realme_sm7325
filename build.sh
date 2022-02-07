# set toolchains directory
TOP=$(realpath ../)

# export aosp gcc toolchains path
export PATH="$TOP/clang/host/linux-x86/clang-r428724/bin:$PATH"
export LD_LIBRARY_PATH="$TOP/clang/host/linux-x86/clang-r428724/lib64:$LD_LIBRARY_PATH"
export PATH="$TOP/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:$PATH"
export MAKE_PATH=${TOP}/build-tools/linux-x86/bin/

export KERNEL_ARCH=arm64
export ARCH=${KERNEL_ARCH}
export DEFCONFIG=lahaina_defconfig

export CROSS_COMPILE=${TOP}/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CLANG_TRIPLE=aarch64-linux-gnu-


export TARGET_INCLUDES=${TARGET_KERNEL_MAKE_CFLAGS}
export TARGET_LINCLUDES=${TARGET_KERNEL_MAKE_LDFLAGS}

TARGET_KERNEL_MAKE_ENV+="HOSTCC=${TOP}/clang/host/linux-x86/clang-r428724/bin/clang "
TARGET_KERNEL_MAKE_ENV+="CC=${TOP}/clang/host/linux-x86/clang-r428724/bin/clang "
TARGET_KERNEL_MAKE_ENV+="LLVM=${TOP}/clang/host/linux-x86/clang-r428724/bin/clang"

${MAKE_PATH}make O=out ${TARGET_KERNEL_MAKE_ENV} ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} CFLAGS="${TARGET_INCLUDES}" LDFLAGS="${TARGET_LINCLUDES}" ${DEFCONFIG}

${MAKE_PATH}make O=out ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} CFLAGS="${TARGET_INCLUDES}" LDFLAGS="${TARGET_LINCLUDES}" ${TARGET_KERNEL_MAKE_ENV} -j$(nproc)
