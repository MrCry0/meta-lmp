require optee-test-fio.inc

SRCREV = "44a31d02379bd8e50762caa5e1592ad81e3339af"

# Due OpenSSL 3.0 deprecated warnings
CFLAGS += "-Wno-error=deprecated-declarations"