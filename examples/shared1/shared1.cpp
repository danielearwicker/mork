#include <shared1.hpp>

SHARED1_EXPORT std::string shared1_concat(const std::string &prefix)
{
	return prefix + "[hello from shared1]";
}

