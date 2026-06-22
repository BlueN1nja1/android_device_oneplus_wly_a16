#include <string>
#include <cctype>

namespace android {
    namespace base {

        // We implement Trim ourselves so we don't rely on Android 16's libbase at all.
        // This perfectly satisfies the proprietary NFC blob's dependency request.
        std::string Trim(const std::string& s) {
            std::string result;
            if (s.empty()) {
                return result;
            }

            size_t start = 0;
            while (start < s.size() && std::isspace(static_cast<unsigned char>(s[start]))) {
                start++;
            }

            size_t end = s.size();
            while (end > start && std::isspace(static_cast<unsigned char>(s[end - 1]))) {
                end--;
            }

            return s.substr(start, end - start);
        }

    } // namespace base
} // namespace android
