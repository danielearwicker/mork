#include <static2.hpp>

#include <static1.hpp>

std::string static2_says()
{
	return "Hello, " + static1_says();
}

