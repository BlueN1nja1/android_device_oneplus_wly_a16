#include <dlfcn.h>
#include <log/log.h>
#include <stdint.h>

#define LOG_TAG "SDM_Shim"

extern "C" {
    // x0 = obj (the ResourceImpl instance)
    // x1 = display (the argument)
    void _ZN3sdm12ResourceImpl17UnregisterDisplayEPv(void* obj, void* display) {
        static void (*real_func)(void*, void*) = nullptr;

        if (!real_func) {
            // Try standard linking lookup first
            real_func = reinterpret_cast<void (*)(void*, void*)>(dlsym(RTLD_NEXT, "_ZN3sdm12ResourceImpl17UnregisterDisplayEPv"));

            // Fallback: Manually grab it from the blob
            if (!real_func) {
                void* handle = dlopen("libsdmextension.so", RTLD_NOW);
                if (handle) {
                    real_func = reinterpret_cast<void (*)(void*, void*)>(dlsym(handle, "_ZN3sdm12ResourceImpl17UnregisterDisplayEPv"));
                }
            }
        }

        // x1 in your tombstone is 0x20. We catch anything under 0x1000 as a bad pointer.
        if (reinterpret_cast<uintptr_t>(display) < 0x1000) {
            ALOGE("Shim: Caught invalid display pointer (%p) in UnregisterDisplay! Preventing crash.", display);
            return;
        }

        if (real_func) {
            real_func(obj, display);
        } else {
            ALOGE("Shim: Real function not found!");
        }
    }
}
