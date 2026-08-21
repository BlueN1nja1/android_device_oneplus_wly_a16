#include <dlfcn.h>
#include <fcntl.h>
#include <string.h>
#include <sys/stat.h>
#include <stdarg.h>
#include <log/log.h>

#define LOG_TAG "AAC_Shim"

// Hook the standard openat() function
extern "C" int openat(int dirfd, const char *pathname, int flags, ...) {
    // Look up the real openat function from the kernel
    static int (*real_openat)(int, const char*, int, ...) = nullptr;
    if (!real_openat) {
        real_openat = reinterpret_cast<int (*)(int, const char*, int, ...)>(dlsym(RTLD_NEXT, "openat"));
    }

    const char* target_path = pathname;

    // Intercept the specific AAC blob requests
    if (pathname && strstr(pathname, "/sys/class/leds/vibrator")) {
        if (strstr(pathname, "activate")) {
            target_path = "/sys/class/qcom-haptics/state";
            ALOGI("Shim: Redirected activate -> %s", target_path);
        } else if (strstr(pathname, "duration")) {
            target_path = "/sys/class/qcom-haptics/primitive_duration";
            ALOGI("Shim: Redirected duration -> %s", target_path);
        }
    }

    // Handle variable arguments for file creation modes
    va_list args;
    va_start(args, flags);
    mode_t mode = 0;
    if (flags & O_CREAT) {
        mode = va_arg(args, mode_t);
    }
    va_end(args);

    // Pass the hijacked path to the real kernel function
    return real_openat(dirfd, target_path, flags, mode);
}
