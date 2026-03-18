# EDK2 202602 changed the build output directory casing from AARCH64 to AArch64
EDK2_PLATFORM:qemuarm64-secureboot-ebbr = "ArmVirtQemu-AArch64"

do_install:append:qemuarm64-secureboot-ebbr() {
    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/QEMU*.fd ${D}/firmware/
    # QEMU requires that the images be minimum of 64M in size
    truncate -s 64M ${D}/firmware/QEMU*.fd
}
