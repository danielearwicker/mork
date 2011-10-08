#include <shared2.hpp>

#include <static2.hpp>

SHARED2_EXPORT std::string shared2_message()
{
	return "shared2 got this from static2: " + static2_says();
}

