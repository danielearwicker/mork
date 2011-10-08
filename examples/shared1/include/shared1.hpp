#ifndef MORK_EXAMPLES_SHARED1_INCLUDED
#define MORK_EXAMPLES_SHARED1_INCLUDED

#ifdef CONFIG_VARIANT_windows
	#ifdef CONFIG_MODULE_shared1
		#define SHARED1_EXPORT __declspec(dllexport)
	#else
		#define SHARED1_EXPORT __declspec(dllimport)
	#endif
#else
	#define SHARED1_EXPORT
#endif

#include <string>

SHARED1_EXPORT std::string shared1_concat(const std::string &prefix);

#endif//MORK_EXAMPLES_SHARED1_INCLUDED
